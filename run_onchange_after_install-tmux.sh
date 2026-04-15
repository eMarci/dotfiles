#!/usr/bin/env bash

# Install tmux/tmux
# https://github.com/tmux/tmux

set -e

DOWNLOAD_URL="https://github.com/tmux/tmux-builds/releases/download/v3.6a/tmux-3.6a-linux-x86_64.tar.gz"
MAN_PAGE_DOWNLOAD_URL="https://raw.githubusercontent.com/tmux/tmux/refs/tags/3.6a/tmux.1"

# Prepare temporary working directory
TEMP_WORKDIR=$(mktemp -d)
trap "rm -rf $TEMP_WORKDIR" EXIT

echo "Installing tmux/tmux ..."

curl -o "${TEMP_WORKDIR}/out.tar.gz" -L "${DOWNLOAD_URL?}"
tar xf "${TEMP_WORKDIR}/out.tar.gz" -C ~/.local/bin
rm -rf "${TEMP_WORKDIR}"
curl -o ~/.local/share/man/man1/tmux.1 -L "${MAN_PAGE_DOWNLOAD_URL?}"

echo "Installed binary and man page"
echo
