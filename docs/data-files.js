var files =[["cova.zig",0],["builtin.zig",1],["std.zig",2],["array_list.zig",2],["BitStack.zig",2],["bounded_array.zig",2],["Build.zig",2],["Build/Cache.zig",2],["Build/Cache/DepTokenizer.zig",2],["Build/Step.zig",2],["Build/Step/CheckFile.zig",2],["Build/Step/CheckObject.zig",2],["Build/Step/ConfigHeader.zig",2],["Build/Step/Fmt.zig",2],["Build/Step/InstallArtifact.zig",2],["Build/Step/InstallDir.zig",2],["Build/Step/InstallFile.zig",2],["Build/Step/ObjCopy.zig",2],["Build/Step/Compile.zig",2],["Build/Step/Options.zig",2],["Build/Step/RemoveDir.zig",2],["Build/Step/Run.zig",2],["Build/Step/TranslateC.zig",2],["Build/Step/WriteFile.zig",2],["buf_map.zig",2],["buf_set.zig",2],["mem.zig",2],["mem/Allocator.zig",2],["child_process.zig",2],["linked_list.zig",2],["dynamic_library.zig",2],["Ini.zig",2],["multi_array_list.zig",2],["packed_int_array.zig",2],["priority_queue.zig",2],["priority_dequeue.zig",2],["Progress.zig",2],["RingBuffer.zig",2],["segmented_list.zig",2],["SemanticVersion.zig",2],["target.zig",2],["target/aarch64.zig",2],["target/arc.zig",2],["target/amdgpu.zig",2],["target/arm.zig",2],["target/avr.zig",2],["target/bpf.zig",2],["target/csky.zig",2],["target/hexagon.zig",2],["target/loongarch.zig",2],["target/m68k.zig",2],["target/mips.zig",2],["target/msp430.zig",2],["target/nvptx.zig",2],["target/powerpc.zig",2],["target/riscv.zig",2],["target/sparc.zig",2],["target/spirv.zig",2],["target/s390x.zig",2],["target/ve.zig",2],["target/wasm.zig",2],["target/x86.zig",2],["target/xtensa.zig",2],["Thread.zig",2],["Thread/Futex.zig",2],["Thread/ResetEvent.zig",2],["Thread/Mutex.zig",2],["Thread/Semaphore.zig",2],["Thread/Condition.zig",2],["Thread/RwLock.zig",2],["Thread/Pool.zig",2],["Thread/WaitGroup.zig",2],["treap.zig",2],["Uri.zig",2],["array_hash_map.zig",2],["atomic.zig",2],["atomic/stack.zig",2],["atomic/queue.zig",2],["atomic/Atomic.zig",2],["base64.zig",2],["bit_set.zig",2],["builtin.zig",2],["test_runner.zig",0],["c.zig",2],["c/tokenizer.zig",2],["coff.zig",2],["compress.zig",2],["compress/deflate.zig",2],["compress/deflate/compressor.zig",2],["compress/deflate/deflate_const.zig",2],["compress/deflate/deflate_fast.zig",2],["compress/deflate/token.zig",2],["compress/deflate/huffman_bit_writer.zig",2],["compress/deflate/huffman_code.zig",2],["compress/deflate/bits_utils.zig",2],["compress/deflate/decompressor.zig",2],["compress/deflate/dict_decoder.zig",2],["compress/gzip.zig",2],["compress/lzma.zig",2],["compress/lzma/decode.zig",2],["compress/lzma/decode/lzbuffer.zig",2],["compress/lzma/decode/rangecoder.zig",2],["compress/lzma/vec2d.zig",2],["compress/lzma2.zig",2],["compress/lzma2/decode.zig",2],["compress/xz.zig",2],["compress/xz/block.zig",2],["compress/zlib.zig",2],["compress/zstandard.zig",2],["compress/zstandard/types.zig",2],["compress/zstandard/decompress.zig",2],["compress/zstandard/decode/block.zig",2],["compress/zstandard/decode/huffman.zig",2],["compress/zstandard/readers.zig",2],["compress/zstandard/decode/fse.zig",2],["comptime_string_map.zig",2],["crypto.zig",2],["crypto/aegis.zig",2],["crypto/test.zig",2],["crypto/aes_gcm.zig",2],["crypto/aes_ocb.zig",2],["crypto/chacha20.zig",2],["crypto/isap.zig",2],["crypto/salsa20.zig",2],["crypto/hmac.zig",2],["crypto/siphash.zig",2],["crypto/cmac.zig",2],["crypto/aes.zig",2],["crypto/keccak_p.zig",2],["crypto/ascon.zig",2],["crypto/modes.zig",2],["crypto/25519/x25519.zig",2],["crypto/25519/curve25519.zig",2],["crypto/25519/field.zig",2],["crypto/25519/scalar.zig",2],["crypto/kyber_d00.zig",2],["crypto/25519/edwards25519.zig",2],["crypto/pcurves/p256.zig",2],["crypto/pcurves/p256/field.zig",2],["crypto/pcurves/common.zig",2],["crypto/pcurves/p256/p256_64.zig",2],["crypto/pcurves/p256/scalar.zig",2],["crypto/pcurves/p256/p256_scalar_64.zig",2],["crypto/pcurves/p384.zig",2],["crypto/pcurves/p384/field.zig",2],["crypto/pcurves/p384/p384_64.zig",2],["crypto/pcurves/p384/scalar.zig",2],["crypto/pcurves/p384/p384_scalar_64.zig",2],["crypto/25519/ristretto255.zig",2],["crypto/pcurves/secp256k1.zig",2],["crypto/pcurves/secp256k1/field.zig",2],["crypto/pcurves/secp256k1/secp256k1_64.zig",2],["crypto/pcurves/secp256k1/scalar.zig",2],["crypto/pcurves/secp256k1/secp256k1_scalar_64.zig",2],["crypto/blake2.zig",2],["crypto/blake3.zig",2],["crypto/md5.zig",2],["crypto/sha1.zig",2],["crypto/sha2.zig",2],["crypto/sha3.zig",2],["crypto/hash_composition.zig",2],["crypto/hkdf.zig",2],["crypto/ghash_polyval.zig",2],["crypto/poly1305.zig",2],["crypto/argon2.zig",2],["crypto/bcrypt.zig",2],["crypto/phc_encoding.zig",2],["crypto/scrypt.zig",2],["crypto/pbkdf2.zig",2],["crypto/25519/ed25519.zig",2],["crypto/ecdsa.zig",2],["crypto/utils.zig",2],["crypto/ff.zig",2],["crypto/tlcsprng.zig",2],["crypto/errors.zig",2],["crypto/tls.zig",2],["crypto/tls/Client.zig",2],["crypto/Certificate.zig",2],["crypto/Certificate/Bundle.zig",2],["crypto/Certificate/Bundle/macos.zig",2],["cstr.zig",2],["debug.zig",2],["dwarf.zig",2],["leb128.zig",2],["dwarf/TAG.zig",2],["dwarf/AT.zig",2],["dwarf/OP.zig",2],["dwarf/LANG.zig",2],["dwarf/FORM.zig",2],["dwarf/ATE.zig",2],["dwarf/EH.zig",2],["dwarf/abi.zig",2],["dwarf/call_frame.zig",2],["dwarf/expressions.zig",2],["elf.zig",2],["enums.zig",2],["event.zig",2],["event/channel.zig",2],["event/future.zig",2],["event/group.zig",2],["event/batch.zig",2],["event/lock.zig",2],["event/locked.zig",2],["event/rwlock.zig",2],["event/rwlocked.zig",2],["event/loop.zig",2],["event/wait_group.zig",2],["fifo.zig",2],["fmt.zig",2],["fmt/errol.zig",2],["fmt/errol/enum3.zig",2],["fmt/errol/lookup.zig",2],["fmt/parse_float.zig",2],["fmt/parse_float/parse_float.zig",2],["fmt/parse_float/parse.zig",2],["fmt/parse_float/common.zig",2],["fmt/parse_float/FloatStream.zig",2],["fmt/parse_float/convert_fast.zig",2],["fmt/parse_float/FloatInfo.zig",2],["fmt/parse_float/convert_eisel_lemire.zig",2],["fmt/parse_float/convert_slow.zig",2],["fmt/parse_float/decimal.zig",2],["fmt/parse_float/convert_hex.zig",2],["fs.zig",2],["fs/path.zig",2],["fs/file.zig",2],["fs/wasi.zig",2],["fs/get_app_data_dir.zig",2],["fs/watch.zig",2],["hash.zig",2],["hash/adler.zig",2],["hash/verify.zig",2],["hash/auto_hash.zig",2],["hash/crc.zig",2],["hash/crc/catalog.zig",2],["hash/fnv.zig",2],["hash/murmur.zig",2],["hash/cityhash.zig",2],["hash/wyhash.zig",2],["hash/xxhash.zig",2],["hash_map.zig",2],["heap.zig",2],["heap/logging_allocator.zig",2],["heap/log_to_writer_allocator.zig",2],["heap/arena_allocator.zig",2],["heap/general_purpose_allocator.zig",2],["heap/WasmAllocator.zig",2],["heap/WasmPageAllocator.zig",2],["heap/PageAllocator.zig",2],["heap/ThreadSafeAllocator.zig",2],["heap/sbrk_allocator.zig",2],["heap/memory_pool.zig",2],["http.zig",2],["http/Client.zig",2],["http/protocol.zig",2],["http/Server.zig",2],["http/Headers.zig",2],["io.zig",2],["io/reader.zig",2],["io/writer.zig",2],["io/seekable_stream.zig",2],["io/buffered_writer.zig",2],["io/buffered_reader.zig",2],["io/peek_stream.zig",2],["io/fixed_buffer_stream.zig",2],["io/c_writer.zig",2],["io/limited_reader.zig",2],["io/counting_writer.zig",2],["io/counting_reader.zig",2],["io/multi_writer.zig",2],["io/bit_reader.zig",2],["io/bit_writer.zig",2],["io/change_detection_stream.zig",2],["io/find_byte_writer.zig",2],["io/buffered_atomic_file.zig",2],["io/stream_source.zig",2],["io/tty.zig",2],["json.zig",2],["json/dynamic.zig",2],["json/stringify.zig",2],["json/static.zig",2],["json/scanner.zig",2],["json/hashmap.zig",2],["json/fmt.zig",2],["log.zig",2],["macho.zig",2],["math.zig",2],["math/float.zig",2],["math/isnan.zig",2],["math/frexp.zig",2],["math/modf.zig",2],["math/copysign.zig",2],["math/isfinite.zig",2],["math/isinf.zig",2],["math/isnormal.zig",2],["math/signbit.zig",2],["math/scalbn.zig",2],["math/ldexp.zig",2],["math/pow.zig",2],["math/powi.zig",2],["math/sqrt.zig",2],["math/cbrt.zig",2],["math/acos.zig",2],["math/asin.zig",2],["math/atan.zig",2],["math/atan2.zig",2],["math/hypot.zig",2],["math/expm1.zig",2],["math/ilogb.zig",2],["math/log.zig",2],["math/log2.zig",2],["math/log10.zig",2],["math/log_int.zig",2],["math/log1p.zig",2],["math/asinh.zig",2],["math/acosh.zig",2],["math/atanh.zig",2],["math/sinh.zig",2],["math/expo2.zig",2],["math/cosh.zig",2],["math/tanh.zig",2],["math/gcd.zig",2],["math/complex.zig",2],["math/complex/abs.zig",2],["math/complex/acosh.zig",2],["math/complex/acos.zig",2],["math/complex/arg.zig",2],["math/complex/asinh.zig",2],["math/complex/asin.zig",2],["math/complex/atanh.zig",2],["math/complex/atan.zig",2],["math/complex/conj.zig",2],["math/complex/cosh.zig",2],["math/complex/ldexp.zig",2],["math/complex/cos.zig",2],["math/complex/exp.zig",2],["math/complex/log.zig",2],["math/complex/pow.zig",2],["math/complex/proj.zig",2],["math/complex/sinh.zig",2],["math/complex/sin.zig",2],["math/complex/sqrt.zig",2],["math/complex/tanh.zig",2],["math/complex/tan.zig",2],["math/big.zig",2],["math/big/rational.zig",2],["math/big/int.zig",2],["meta.zig",2],["meta/trait.zig",2],["meta/trailer_flags.zig",2],["net.zig",2],["os.zig",2],["os/linux.zig",2],["os/linux/io_uring.zig",2],["os/linux/vdso.zig",2],["os/linux/tls.zig",2],["os/linux/start_pie.zig",2],["os/linux/bpf.zig",2],["os/linux/bpf/btf.zig",2],["os/linux/bpf/btf_ext.zig",2],["os/linux/bpf/kern.zig",2],["os/linux/ioctl.zig",2],["os/linux/seccomp.zig",2],["os/linux/syscalls.zig",2],["os/plan9.zig",2],["os/plan9/errno.zig",2],["os/uefi.zig",2],["os/uefi/protocol.zig",2],["os/uefi/protocol/loaded_image.zig",2],["os/uefi/protocol/device_path.zig",2],["os/uefi/protocol/rng.zig",2],["os/uefi/protocol/shell_parameters.zig",2],["os/uefi/protocol/simple_file_system.zig",2],["os/uefi/protocol/file.zig",2],["os/uefi/protocol/block_io.zig",2],["os/uefi/protocol/simple_text_input.zig",2],["os/uefi/protocol/simple_text_input_ex.zig",2],["os/uefi/protocol/simple_text_output.zig",2],["os/uefi/protocol/simple_pointer.zig",2],["os/uefi/protocol/absolute_pointer.zig",2],["os/uefi/protocol/graphics_output.zig",2],["os/uefi/protocol/edid.zig",2],["os/uefi/protocol/simple_network.zig",2],["os/uefi/protocol/managed_network.zig",2],["os/uefi/protocol/ip6_service_binding.zig",2],["os/uefi/protocol/ip6.zig",2],["os/uefi/protocol/ip6_config.zig",2],["os/uefi/protocol/udp6_service_binding.zig",2],["os/uefi/protocol/udp6.zig",2],["os/uefi/protocol/hii_database.zig",2],["os/uefi/protocol/hii_popup.zig",2],["os/uefi/device_path.zig",2],["os/uefi/hii.zig",2],["os/uefi/status.zig",2],["os/uefi/tables.zig",2],["os/uefi/tables/boot_services.zig",2],["os/uefi/tables/runtime_services.zig",2],["os/uefi/tables/configuration_table.zig",2],["os/uefi/tables/system_table.zig",2],["os/uefi/tables/table_header.zig",2],["os/uefi/pool_allocator.zig",2],["os/wasi.zig",2],["os/windows.zig",2],["os/windows/advapi32.zig",2],["os/windows/kernel32.zig",2],["os/windows/ntdll.zig",2],["os/windows/ole32.zig",2],["os/windows/psapi.zig",2],["os/windows/shell32.zig",2],["os/windows/user32.zig",2],["os/windows/ws2_32.zig",2],["os/windows/gdi32.zig",2],["os/windows/winmm.zig",2],["os/windows/crypt32.zig",2],["os/windows/nls.zig",2],["os/windows/win32error.zig",2],["os/windows/ntstatus.zig",2],["os/windows/lang.zig",2],["os/windows/sublang.zig",2],["once.zig",2],["pdb.zig",2],["process.zig",2],["rand.zig",2],["rand/Ascon.zig",2],["rand/ChaCha.zig",2],["rand/Isaac64.zig",2],["rand/Pcg.zig",2],["rand/Xoroshiro128.zig",2],["rand/Xoshiro256.zig",2],["rand/Sfc64.zig",2],["rand/RomuTrio.zig",2],["rand/ziggurat.zig",2],["sort.zig",2],["sort/block.zig",2],["sort/pdq.zig",2],["simd.zig",2],["ascii.zig",2],["tar.zig",2],["testing.zig",2],["testing/failing_allocator.zig",2],["time.zig",2],["time/epoch.zig",2],["tz.zig",2],["unicode.zig",2],["valgrind.zig",2],["valgrind/memcheck.zig",2],["valgrind/callgrind.zig",2],["wasm.zig",2],["zig.zig",2],["zig/tokenizer.zig",2],["zig/fmt.zig",2],["zig/ErrorBundle.zig",2],["zig/Server.zig",2],["zig/Client.zig",2],["zig/string_literal.zig",2],["zig/number_literal.zig",2],["zig/primitives.zig",2],["zig/Ast.zig",2],["zig/Parse.zig",2],["zig/system.zig",2],["zig/system/NativePaths.zig",2],["zig/system/NativeTargetInfo.zig",2],["zig/system/windows.zig",2],["zig/system/darwin.zig",2],["zig/system/darwin/macos.zig",2],["zig/system/linux.zig",2],["zig/system/arm.zig",2],["zig/CrossTarget.zig",2],["zig/c_builtins.zig",2],["zig/c_translation.zig",2],["start.zig",2],["Command.zig",0],["Option.zig",0],["Value.zig",0],["utils.zig",0],["aux_docs.zig",0]];