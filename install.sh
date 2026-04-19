sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin \
    && export PATH="$HOME/.local/bin:$PATH" \
    && chezmoi init https://github.com/eMarci/dotfiles.git \
    && chezmoi apply
