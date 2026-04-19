# `dotfiles`

My personal `dotfiles` repository, managed by [chezmoi](https://github.com/twpayne/chezmoi).

## Installation

The main idea I like to follow is to always standalone binary releases instead of using `apt`,
simply because I like to have control over what exactly gets installed (unless I need something quickly).

I also put all of my user-specific installations in `~/.local/`. That means that all completions, man pages,
and the binaries themselves all live in this directory.

This code block contains everything you need to install these dotfiles:

### Script

```bash
curl -L https://raw.githubusercontent.com/eMarci/dotfiles/refs/heads/main/install.sh | bash && exec bash
```

### Caveats

GitHub CLI unfortunately only allows interactive login without an access token.
During interactive login, you may provide an access token or choose the browser login.
Only after authentication succeeds can we install extensions, such as `gh-dash`.
