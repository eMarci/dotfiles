#!/usr/bin/env bash

check() {
    local PROGRAM="$1"
    
    # Check if available at all
    command -v "$PROGRAM" >/dev/null 2>&1 || return 1

    # Check version
}

# Prepare necessary directories
# ~/.local
# ├── bin
# └── share
#     ├── bash-completion
#     │   └── completions
#     └── man
#         └── man1
mkdir -p ~/.local/{bin,share/{bash-completion/completions,man/man1}}

# Prepare temporary working directory
TEMP_WORKDIR=$(mktemp -d)
trap "rm -rf $TEMP_WORKDIR" EXIT

# Install sharkdp/bat
# https://github.com/sharkdp/bat
curl -o "${TEMP_WORKDIR}/bat.tar.gz" -L "${BAT_DOWNLOAD_URL?}"
tar xf "${TEMP_WORKDIR}/bat.tar.gz" --strip-components=1
mv "${TEMP_WORKDIR}/bat" ~/.local/bin
mv "${TEMP_WORKDIR}/bat.1" ~/.local/share/man/man1
mv "${TEMP_WORKDIR}/autocomplete/bat.bash" ~/.local/share/bash-completion/completions
rm -rf "${TEMP_WORKDIR}"/*
