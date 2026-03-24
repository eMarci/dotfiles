#!/usr/bin/env bash

set -e

DOWNLOAD_URL="https://github.com/sharkdp/bat/releases/download/v0.26.1/bat-v0.26.1-x86_64-unknown-linux-musl.tar.gz"

# Prepare temporary working directory
TEMP_WORKDIR=$(mktemp -d)
trap "rm -rf $TEMP_WORKDIR" EXIT

# Install sharkdp/bat
# https://github.com/sharkdp/bat
curl -o "${TEMP_WORKDIR}/out.tar.gz" -L "${DOWNLOAD_URL?}"
tar xf "${TEMP_WORKDIR}/out.tar.gz" --strip-components=1 -C "${TEMP_WORKDIR}"
mv "${TEMP_WORKDIR}/bat" ~/.local/bin
mv "${TEMP_WORKDIR}/bat.1" ~/.local/share/man/man1
mv "${TEMP_WORKDIR}/autocomplete/bat.bash" ~/.local/share/bash-completion/completions
rm -rf "${TEMP_WORKDIR}"
