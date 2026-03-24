#!/usr/bin/env bash

# Install cli/cli
# https://github.com/cli/cli

set -e

DOWNLOAD_URL="https://github.com/cli/cli/releases/download/v2.88.1/gh_2.88.1_linux_amd64.tar.gz"

# Prepare temporary working directory
TEMP_WORKDIR=$(mktemp -d)
trap "rm -rf $TEMP_WORKDIR" EXIT

echo "Installing cli/cli ..."

curl -o "${TEMP_WORKDIR}/out.tar.gz" -L "${DOWNLOAD_URL?}"
tar xf "${TEMP_WORKDIR}/out.tar.gz" --strip-components=1 -C "${TEMP_WORKDIR}"
mv "${TEMP_WORKDIR}/bin/gh" ~/.local/bin
mv "${TEMP_WORKDIR}/share/man/man1"/* ~/.local/share/man/man1
rm -rf "${TEMP_WORKDIR}"

echo "Installed binary and man page"
echo
