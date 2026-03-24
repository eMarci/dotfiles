#!/usr/bin/env bash

set -e

DOWNLOAD_URL="https://github.com/jesseduffield/lazydocker/releases/download/v0.25.0/lazydocker_0.25.0_Linux_x86_64.tar.gz"

# Prepare temporary working directory
TEMP_WORKDIR=$(mktemp -d)
trap "rm -rf $TEMP_WORKDIR" EXIT

# Install jesseduffield/lazydocker
# https://github.com/jesseduffield/lazydocker
curl -o "${TEMP_WORKDIR}/out.tar.gz" -L "${DOWNLOAD_URL?}"
tar xf "${TEMP_WORKDIR}/out.tar.gz" -C "${TEMP_WORKDIR}"
mv "${TEMP_WORKDIR}/lazydocker" ~/.local/bin/lzd
rm -rf "${TEMP_WORKDIR}"
