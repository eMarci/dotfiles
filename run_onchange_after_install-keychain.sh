#!/usr/bin/env bash

# Install danielrobbins/keychain
# https://github.com/danielrobbins/keychain

set -e

DOWNLOAD_URL="https://github.com/danielrobbins/keychain/releases/download/2.9.8/keychain"
MAN_PAGE_DOWNLOAD_URL="https://github.com/danielrobbins/keychain/releases/download/2.9.8/keychain.1"

echo "Installing danielrobbins/keychain ..."

curl -o ~/.local/bin/keychain -L "${DOWNLOAD_URL?}"
chmod +x ~/.local/bin/keychain
curl -o ~/.local/share/man/man1/keychain.1 -L "${MAN_DOWNLOAD_URL?}"

echo "Installed binary and man page"
echo
