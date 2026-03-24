#!/usr/bin/env bash

set -e

DOWNLOAD_URL="https://github.com/junegunn/fzf/releases/download/v0.70.0/fzf-0.70.0-linux_amd64.tar.gz"
MAN_PAGE_DOWNLOAD_URL="https://raw.githubusercontent.com/junegunn/fzf/refs/tags/v0.70.0/man/man1/fzf.1"

# Prepare temporary working directory
TEMP_WORKDIR=$(mktemp -d)
trap "rm -rf $TEMP_WORKDIR" EXIT

# Install junegunn/fzf
# https://github.com/funegunn/fzf
curl -o "${TEMP_WORKDIR}/out.tar.gz" -L "${DOWNLOAD_URL?}"
tar xf "${TEMP_WORKDIR}/out.tar.gz" -C ~/.local/bin
curl -o ~/.local/share/man/man1/fzf.1 -L "${MAN_PAGE_DOWNLOAD_URL?}"
rm -rf "${TEMP_WORKDIR}"
