__list_hosts() {
    local results=()
    local files=()
    local confirmed_files=()
    [[ -r "$HOME/.ssh/config" ]] && files+=("$HOME/.ssh/config")

    local current includes
    while (( ${#files[@]} )); do
        includes=()

        readarray -d ' ' -t includes < <(rg -i include "${files[0]}" | cut -d' ' -f2- | tr -d '\n')

        for current in "${includes[@]}"; do
            current="${current//\~/$HOME}"
            if [[ $current == *\** ]]; then
                readarray -t -O "${#files[@]}" files < <(compgen -G "$current")
            fi
        done

        confirmed_files+=("${files[0]}")
        unset 'files[0]'
        files=("${files[@]}")
    done

    local opts
    if (( ${#confirmed_files[@]} )); then
        opts=$(
            awk '
                # Strip inline comments
                { sub(/[[:space:]]*#.*/, ""); }
                # Match Host (case-insensitive), collect aliases
                tolower($1) == "host" {
                        for (i = 2; i <= NF; i++) {
                                if ($i !~ /[\*\?]/) print $i
                        }
                }
            ' "${confirmed_files[@]}" 2>/dev/null | LC_ALL=C sort -u
        )
    else
        opts=""
    fi

    echo "$opts"
}

__fzf_ssh_hosts() {
    _fzf_complete +m -- "$@" < <(__list_hosts)
}

_fzf_complete_ssh_notrigger() {
    FZF_COMPLETION_TRIGGER='' __fzf_ssh_hosts
}

complete -o bashdefault -o default -F _fzf_complete_ssh_notrigger ssh
