# `dotfiles`

My personal `dotfiles` repository, managed by [chezmoi](https://github.com/twpayne/chezmoi).

## Apps

The current list of included apps (and relevant plugins) are as follows:

- [sharkdp/bat](https://github.com/sharkdp/bat)
- [eza-community/eza](https://github.com/eza-community/eza)
- [sharkdp/fd](https://github.com/sharkdp/fd)
- [junegunn/fzf](https://github.com/junegunn/fzf)
- [(GitHub) cli/cli](https://github.com/cli/cli)
  - [dlvhdr/gh-dash](https://github.com/dlvhdr/gh-dash)
- [danielrobbins/keychain](https://github.com/danielrobbins/keychain)
- [jesseduffield/lazydocker](https://github.com/jesseduffield/lazydocker)
- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
- [starship/starship](https://github.com/starship/starship)
- [tmux/tmux](https://github.com/tmux/tmux)
  - [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)
  - [tmux-plugins/tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)
  - [nordtheme/tmux](https://github.com/nordtheme/tmux)
- [junegunn/vim-plug](https://junegunn/vim-plug)
  - [nordtheme/vim](https://github.com/nordtheme/vim)
  - [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)

## Theme

I went with [Nord](https://www.nordtheme.com/) because I prefer a smooth, pastel blue color palette in general.
Most programs in this repository are configured to follow the Nord color palette, including `man`, `tmux`, `vim`, `fzf`, etc.

Proper color mapping also requires that your terminal application has Nord set as its theme. Some apps such as `vim` will work
with any terminal theme, but `tmux` specifically needs the terminal to use the Nord theme for the colors to be mapped correctly.

In the case of [Windows Terminal](https://github.com/microsoft/terminal) (as of version [1.24.10921.0](https://github.com/microsoft/terminal/releases/tag/v1.24.10921.0))
there is no built-in Nord theme, so as an alternative, use [this](https://github.com/thismat/nord-windows-terminal) repository.

## Installation

The main idea I like to follow is to always use standalone binary releases instead of using `apt`,
simply because I like to have control over what exactly gets installed (unless I need something quickly).

I also put all of my user-specific installations in `~/.local/`. That means that all completions, man pages,
and the binaries themselves all live in this directory.

This code block contains everything you need to install these dotfiles:

### Script

```bash
curl -L https://raw.githubusercontent.com/eMarci/dotfiles/refs/heads/main/install.sh | bash && exec bash
```

## Caveats

GitHub CLI unfortunately only allows interactive login without an access token.
During interactive login, you may provide an access token or choose the browser login.
Only after authentication succeeds can we install extensions, such as `gh-dash`.
This authentication flow is managed in the `.bashrc` file, not by `chezmoi`.
