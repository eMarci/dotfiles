#!/usr/bin/env bash

# Install tmux-plugins/tpm
# https://github.com/tmux-plugins/tpm

set -e

echo "Installing tmux-plugins/tpm ..."

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

echo "Installed tpm and all other tmux plugins"
echo
