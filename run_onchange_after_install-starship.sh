#!/usr/bin/env bash

# Install starship/starship
# https://github.com/starship/starship

set -e

DOWNLOAD_URL="https://github.com/starship/starship/releases/download/v1.24.2/starship-x86_64-unknown-linux-musl.tar.gz"

# Prepare temporary working directory
TEMP_WORKDIR=$(mktemp -d)
trap "rm -rf $TEMP_WORKDIR" EXIT

echo "Installing starship/starship ..."

curl -o "${TEMP_WORKDIR}/out.tar.gz" -L "${DOWNLOAD_URL?}"
tar xf "${TEMP_WORKDIR}/out.tar.gz" -C ~/.local/bin
rm -rf "${TEMP_WORKDIR}"

echo "Installed binary"
echo
