#!/usr/bin/env bash

# Install eza-community/eza
# https://github.com/eza-community/eza

set -e

DOWNLOAD_URL="https://github.com/eza-community/eza/releases/download/v0.23.4/eza_x86_64-unknown-linux-musl.tar.gz"

# Prepare temporary working directory
TEMP_WORKDIR=$(mktemp -d)
trap "rm -rf $TEMP_WORKDIR" EXIT

echo "Installing eza-community/eza ..."

curl -o "${TEMP_WORKDIR}/out.tar.gz" -L "${DOWNLOAD_URL?}"
tar xf "${TEMP_WORKDIR}/out.tar.gz" -C "${TEMP_WORKDIR}"
mv "${TEMP_WORKDIR}/eza" ~/.local/bin
rm -rf "${TEMP_WORKDIR}"

echo "Installed binary"
echo
