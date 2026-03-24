#!/usr/bin/env bash

# Install BurntSushi/ripgrep
# https://github.com/BurntSushi/ripgrep

set -e

DOWNLOAD_URL="https://github.com/BurntSushi/ripgrep/releases/download/15.1.0/ripgrep-15.1.0-x86_64-unknown-linux-musl.tar.gz"

# Prepare temporary working directory
TEMP_WORKDIR=$(mktemp -d)
trap "rm -rf $TEMP_WORKDIR" EXIT

echo "Installing BurntSushi/ripgrep ..."

curl -o "${TEMP_WORKDIR}/out.tar.gz" -L "${DOWNLOAD_URL?}"
tar xf "${TEMP_WORKDIR}/out.tar.gz" --strip-components=1 -C "${TEMP_WORKDIR}"
mv "${TEMP_WORKDIR}/rg" ~/.local/bin
mv "${TEMP_WORKDIR}/doc/rg.1" ~/.local/share/man/man1
rm -rf "${TEMP_WORKDIR}"

echo "Installed binary and man page"
echo
