//! Cova. Commands, Options, Values, Arguments. A simple command line argument parser for Zig.
//!
//! Cova is based on the idea that Arguments will fall into one of three categories: Commands, Options, or Values. These componenets are assembled into a single struct which is then used to parse argument tokens.

// Standard
const std = @import("std");
const log = std.log;
const mem = std.mem;
const proc = std.process;

const eql = mem.eql;

// Cova
pub const Command = @import("Command.zig");
pub const Option = @import("Option.zig");
pub const Value = @import("Value.zig");

/// Config for custom Parsing options.
pub const ParseConfig = struct {
    /// Mandate that all Values must be filled, otherwise error out.
    /// This should generally be set to `true`. Prefer to use Options over Values for Arguments that are not mandatory.
    vals_mandatory: bool = true,
    /// Skip the first Argument (the executable's name).
    /// This should generally be set to `true`, but the option is here for unforeseen outliers.
    skip_exe_name_arg: bool = true,
    /// Allow there to be no space ' ' between Options and Values.
    /// This is allowed per the POSIX standard, but may not be ideal as it interrupts the parsing of chained booleans even in the event of a misstype.
    allow_opt_val_no_space: bool = true,
    /// Specify custom Separators between Options and their Values.
    /// Spaces ' ' are implicitly included.
    opt_val_seps: []const u8 = "=",
};

var usage_help_flag: bool = false;
/// Parse provided Argument tokens into Commands, Options, and Values.
pub fn parseArgs(
    args: *const proc.ArgIterator, 
    comptime CustomCommand: type, 
    cmd: *const CustomCommand, 
    writer: anytype,
    parse_config: ParseConfig,
) !void {
    var val_idx: u8 = 0;

    const optType = @TypeOf(cmd.*).CustomOption;

    // Bypass argument 0 (the filename being executed);
    const init_arg = 
        if (parse_config.skip_exe_name_arg and @constCast(args).inner.index == 0) @constCast(args).next()
        else argsPeak(args); 
    log.debug("Parsing Command '{s}'...", .{ cmd.name });
    log.debug("Initial Arg: {?s}", .{ init_arg orelse "END OF ARGS!" });
    defer log.debug("Finished Parsing '{s}'.", .{ cmd.name });

    parseArg: while (@constCast(args).next()) |arg| {
        if (init_arg == null) break :parseArg;
        var unmatched = false;
        // Check for a Sub Command first...
        if (cmd.sub_cmds != null) {
            log.debug("Attempting to Parse Commands...", .{});
            for (cmd.sub_cmds.?) |sub_cmd| {
                if (eql(u8, sub_cmd.name, arg)) {
                    parseArgs(args, CustomCommand, sub_cmd, writer, parse_config) catch { 
                        try writer.print("Could not parse Command '{s}'.\n", .{ sub_cmd.name });
                        try sub_cmd.usage(writer);
                        try writer.print("\n\n", .{});
                        return error.CouldNotParseCommand;
                    };
                    log.debug("Parsed Command '{s}'.", .{ sub_cmd.name });
                    cmd.setSubCmd(sub_cmd); 
                    continue :parseArg;
                }
            }
            unmatched = true;
            log.debug("No Commands Matched for Command '{s}'.", .{ cmd.name });
        }
        // ...Then for any Options...
        if (cmd.opts != null) {
            log.debug("Attempting to Parse Options...", .{});
            const short_pf = optType.short_prefix;
            const long_pf = optType.long_prefix;
            // - Short Options
            if (arg[0] == short_pf and arg[1] != short_pf) {
                const short_opts = arg[1..];
                shortOpts: for (short_opts, 0..) |short_opt, short_idx| {
                    for (cmd.opts.?) |opt| {
                        if (opt.short_name != null and short_opt == opt.short_name.?) {
                            // Handle Argument provided to this Option with '=' instead of ' '.
                            if (mem.indexOfScalar(u8, parse_config.opt_val_seps, short_opts[short_idx + 1]) != null) {
                                if (eql(u8, opt.val.valType(), "bool")) {
                                    try writer.print("The Option '{c}{?c}: {s}' is a Boolean/Toggle and cannot take an argument.\n", .{ 
                                        short_pf, 
                                        opt.short_name, 
                                        opt.name 
                                    });
                                    try opt.usage(writer);
                                    try writer.print("\n\n", .{});
                                    return error.BoolCannotTakeArgument;
                                }
                                if (short_idx + 2 >= short_opts.len) return error.EmptyArgumentProvidedToOption;
                                const opt_arg = short_opts[(short_idx + 2)..];
                                opt.val.set(opt_arg) catch {
                                    try writer.print("Could not parse Option '{c}{?c}: {s}'.\n", .{ 
                                        short_pf,
                                        opt.short_name, 
                                        opt.name 
                                    });
                                    try opt.usage(writer);
                                    try writer.print("\n\n", .{});
                                    return error.CouldNotParseOption;
                                };
                                log.debug("Parsed Option '{?c}'.", .{ opt.short_name });
                                continue :parseArg;
                            }
                            // Handle final Option in a chain of Short Options
                            else if (short_idx == short_opts.len - 1) { 
                                if (eql(u8, opt.val.valType(), "bool")) try @constCast(opt).val.set("true")
                                else {
                                    parseOpt(args, @TypeOf(opt.*), opt) catch {
                                        try writer.print("Could not parse Option '{c}{?c}: {s}'.\n", .{ 
                                            short_pf,
                                            opt.short_name, 
                                            opt.name 
                                        });
                                        try opt.usage(writer);
                                        try writer.print("\n\n", .{});
                                        return error.CouldNotParseOption;
                                    };
                                }
                                log.debug("Parsed Option '{?c}'.", .{ opt.short_name });
                                continue :parseArg;
                            }
                            // Handle a boolean Option before the final Short Option in a chain.
                            else if (eql(u8, opt.val.valType(), "bool")) {
                                try @constCast(opt).val.set("true");
                                log.debug("Parsed Option '{?c}'.", .{ opt.short_name });
                                continue :shortOpts;
                            }
                            // Handle a non-boolean Option which is given a Value without a space ' ' to separate them.
                            else if (parse_config.allow_opt_val_no_space) {
                                var short_names_buf: [100]u8 = undefined;
                                const short_names = short_names_buf[0..];
                                for (cmd.opts.?, 0..) |s_opt, idx| short_names[idx] = s_opt.short_name.?;
                                if (mem.indexOfScalar(u8, short_names, short_opts[short_idx + 1]) == null) {
                                    try @constCast(opt).val.set(short_opts[(short_idx + 1)..]);
                                    log.debug("Parsed Option '{?c}'.", .{ opt.short_name });
                                    continue :parseArg;
                                }
                            }
                        }
                    }
                    try writer.print("Could not parse Option '{c}{?c}'.\n", .{ short_pf, short_opt });
                    try cmd.usage(writer);
                    try writer.print("\n\n", .{});
                    return error.CouldNotParseOption;
                }
            }
            // - Long Options
            else if (eql(u8, arg[0..2], long_pf)) {
                const long_opt = arg[2..];
                for (cmd.opts.?) |opt| {
                    const long_len = opt.long_name.?.len;
                    if (opt.long_name != null) {
                        // Handle Value provided to this Option with custom Separator (ex: '=') instead of a space ' '.
                        if (long_opt.len > opt.long_name.?.len and eql(u8, long_opt[0..long_len], opt.long_name.?)) {
                            if (mem.indexOfScalar(u8, parse_config.opt_val_seps, long_opt[long_len]) != null) {
                                if (eql(u8, opt.val.valType(), "bool")) {
                                    try writer.print("The Option '{s}{?s}: {s}' is a Boolean/Toggle and cannot take an argument.\n", .{ 
                                        long_pf, 
                                        opt.long_name, 
                                        opt.name 
                                    });
                                    try opt.usage(writer);
                                    try writer.print("\n\n", .{});
                                    return error.BoolCannotTakeArgument;
                                }
                                if (long_len + 1 >= long_opt.len) return error.EmptyArgumentProvidedToOption;
                                const opt_arg = long_opt[(long_len + 1)..];
                                opt.val.set(opt_arg) catch {
                                    try writer.print("Could not parse Option '{s}{?s}: {s}'.\n", .{ 
                                        long_pf,
                                        opt.long_name, 
                                        opt.name 
                                    });
                                    try opt.usage(writer);
                                    try writer.print("\n\n", .{});
                                    return error.CouldNotParseOption;
                                };
                                log.debug("Parsed Option '{?s}'.", .{ opt.long_name });
                                continue :parseArg;
                            }
                        }
                        // Handle normally provided Value to Option
                        else if (eql(u8, long_opt, opt.long_name.?)) {
                            // Handle Boolean/Toggle Option.
                            if (eql(u8, opt.val.valType(), "bool")) try @constCast(opt).val.set("true")
                            // Handle Option with normal Argument.
                            else {
                                parseOpt(args, @TypeOf(opt.*), opt) catch {
                                    try writer.print("Could not parse Option '{s}{?s}: {s}'.\n", .{ 
                                        long_pf,
                                        opt.long_name, 
                                        opt.name 
                                    });
                                    try opt.usage(writer);
                                    try writer.print("\n\n", .{});
                                    return error.CouldNotParseOption;
                                };
                            }
                            log.debug("Parsed Option '{?s}'.", .{ opt.long_name });
                            continue :parseArg;
                        }
                    }
                }
                try writer.print("Could not parse Argument '{s}{?s}' to an Option.\n", .{ long_pf, long_opt });
                try cmd.usage(writer);
                try writer.print("\n\n", .{});
                return error.CouldNotParseOption;
            }
            unmatched = true;
            log.debug("No Options Matched for Command '{s}'.", .{ cmd.name });
        }
        // ...Finally, for any Values.
        if (cmd.vals != null) {
            log.debug("Attempting to Parse Values...", .{});
            if (val_idx >= cmd.vals.?.len) {
                try writer.print("Too many Values provided for Command '{s}'.\n", .{ cmd.name });
                try cmd.usage(writer);
                return error.TooManyValues;
            }
            const val = cmd.vals.?[val_idx];
            val.set(arg) catch {
                try writer.print("Could not parse Argument '{s}' to Value '{s}'.\n", .{ arg, val.name() });
                try cmd.usage(writer);
                try writer.print("\n", .{});
            };

            if (val.argIdx() == val.maxArgs()) val_idx += 1;

            log.debug("Parsed Value '{?s}'.", .{ val.name() });
            continue :parseArg;
        }

        // Check if the Command expected an Argument but didn't get a match.
        if (unmatched) {
            try writer.print("Unrecognized Argument '{s}' for Command '{s}'.\n", .{ arg, cmd.name });
            try cmd.help(writer);
            return error.UnrecognizedArgument;
        }
        // For Commands that expect no Arguments but are given one, fail to the Help message.
        else {
            try writer.print("Command '{s}' does not expect any arguments, but '{s}' was passed.\n", .{ cmd.name, arg });
            try cmd.help(writer);
            return error.UnexpectedArgument;
        }
    }
    // Check for missing Values if they are Mandated.
    if (!usage_help_flag) usage_help_flag = (cmd.checkFlag("help") or cmd.checkFlag("usage"));
    if (parse_config.vals_mandatory and 
        cmd.vals != null and 
        val_idx < cmd.vals.?.len and
        !usage_help_flag
    ) {
        try writer.print("Command '{s}' expects {d} Values, but only recieved {d}.\n", .{
            cmd.name,
            cmd.vals.?.len,
            val_idx,
        });
        try cmd.help(writer);
        return error.ExpectedMoreValues;
    }
}

/// Parse an Option for the given Command.
fn parseOpt(args: *const proc.ArgIterator, comptime opt_type: type, opt: *const opt_type) !void {
    const peak_arg = argsPeak(args);
    const set_arg = 
        if (peak_arg == null or peak_arg.?[0] == '-') setArg: {
            _ = @constCast(args).next();
            break :setArg "true";
        }
        else @constCast(args).next().?;
    try opt.val.set(set_arg);
}

/// Peak at the next Argument in the provided ArgIterator without advancing the index.
fn argsPeak(args: *const proc.ArgIterator) ?[]const u8 {
    const peak_arg = @constCast(args).next();
    @constCast(args).inner.index -= 1;
    return peak_arg;
}
