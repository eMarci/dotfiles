#!/usr/bin/env bash

# Install jarun/nnn
# https://github.com/jarun/nnn

set -e

DOWNLOAD_URL="https://github.com/jarun/nnn/releases/download/v5.2/nnn-nerd-static-5.2.x86_64.tar.gz"
MAN_PAGE_DOWNLOAD_URL="https://raw.githubusercontent.com/jarun/nnn/refs/tags/v5.2/nnn.1"

# Prepare temporary working directory
TEMP_WORKDIR=$(mktemp -d)
trap "rm -rf $TEMP_WORKDIR" EXIT

echo "Installing jarun/nnn ..."

curl -o "${TEMP_WORKDIR}/out.tar.gz" -L "${DOWNLOAD_URL?}"
tar xf "${TEMP_WORKDIR}/out.tar.gz" -C "${TEMP_WORKDIR}"
mv "${TEMP_WORKDIR}/nnn-nerd-static" ~/.local/bin/nnn
rm -rf "${TEMP_WORKDIR}"
curl -o ~/.local/share/man/man1/nnn.1 -L "${MAN_PAGE_DOWNLOAD_URL?}"

echo "Installed binary and man page"
echo
