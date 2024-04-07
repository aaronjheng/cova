#! /usr/bin/env bash

# This Tab Completion script was generated by the Cova Library.
# Details at https://github.com/00JCIV00/cova


# Bash Completion Installation Instructions for basic-app
# 1. Place this script in a directory like /etc/bash_completion.d/ (Linux)
#    or /usr/local/etc/bash_completion.d/ (Mac, if using Homebrew and bash-completion)
#
# 2. Ensure the script has executable permissions:
#    chmod +x basic-app-completion.bash
#
# 3. Source this script from your .bashrc or .bash_profile by adding:
#    . /path/to/basic-app-completion.bash
#
# 4. Restart your terminal session or source your profile again:
#    source ~/.bashrc  # or ~/.bash_profile


_basic-app_completions() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD - 1]}"

    case "${prev}" in
        "new")
            _basic-app_new_completions
            ;;
        "open")
            _basic-app_open_completions
            ;;
        "list")
            _basic-app_list_completions
            ;;
        "clean")
            _basic-app_clean_completions
            ;;
        "view-lists")
            _basic-app_view-lists_completions
            ;;
        "basic-app")
            COMPREPLY=($(compgen -W "new open list clean view-lists help usage --help --usage" -- ${cur}))
            ;;
        *)
            COMPREPLY=($(compgen -f -- ${cur}))
    esac
}

_basic-app_new_completions() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD - 1]}"

    case "${prev}" in
        "new")
            COMPREPLY=($(compgen -W "help usage --first-name --last-name --age --phone --address --help --usage" -- ${cur}))
            ;;
        *)
            COMPREPLY=($(compgen -f -- ${cur}))
    esac
}

_basic-app_open_completions() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD - 1]}"

    case "${prev}" in
        "open")
            COMPREPLY=($(compgen -W "help usage --help --usage" -- ${cur}))
            ;;
        *)
            COMPREPLY=($(compgen -f -- ${cur}))
    esac
}

_basic-app_list_completions() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD - 1]}"

    case "${prev}" in
        "filter")
            _basic-applist_filter_completions
            ;;
        "list")
            COMPREPLY=($(compgen -W "filter help usage --help --usage" -- ${cur}))
            ;;
        *)
            COMPREPLY=($(compgen -f -- ${cur}))
    esac
}

_basic-app_list_filter_completions() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD - 1]}"

    case "${prev}" in
        "filter")
            COMPREPLY=($(compgen -W "help usage --id --admin --age --first-name --last-name --phone --address --help --usage" -- ${cur}))
            ;;
        *)
            COMPREPLY=($(compgen -f -- ${cur}))
    esac
}

_basic-app_clean_completions() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD - 1]}"

    case "${prev}" in
        "clean")
            COMPREPLY=($(compgen -W "help usage --file --help --usage" -- ${cur}))
            ;;
        *)
            COMPREPLY=($(compgen -f -- ${cur}))
    esac
}

_basic-app_view-lists_completions() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD - 1]}"

    case "${prev}" in
        "view-lists")
            COMPREPLY=($(compgen -W "help usage --help --usage" -- ${cur}))
            ;;
        *)
            COMPREPLY=($(compgen -f -- ${cur}))
    esac
}


complete -F _basic-app_completions basic-app