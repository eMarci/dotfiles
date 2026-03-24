#!/usr/bin/env bash

# Install sharkdp/fd
# https://github.com/sharkdp/fd

set -e

DOWNLOAD_URL="https://github.com/sharkdp/fd/releases/download/v10.4.2/fd-v10.4.2-x86_64-unknown-linux-musl.tar.gz"

# Prepare temporary working directory
TEMP_WORKDIR=$(mktemp -d)
trap "rm -rf $TEMP_WORKDIR" EXIT

echo "Installing sharkdp/fd ..."

curl -o "${TEMP_WORKDIR}/out.tar.gz" -L "${DOWNLOAD_URL?}"
tar xf "${TEMP_WORKDIR}/out.tar.gz" --strip-components=1 -C "${TEMP_WORKDIR}"
mv "${TEMP_WORKDIR}/fd" ~/.local/bin
mv "${TEMP_WORKDIR}/fd.1" ~/.local/share/man/man1
mv "${TEMP_WORKDIR}/autocomplete/fd.bash" ~/.local/share/bash-completion/completions
rm -rf "${TEMP_WORKDIR}"

echo "Installed binary, man page and completions"
echo
