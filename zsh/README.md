# zsh

This is an Oh My Zsh configuration with project aliases and an OpenCode wrapper
that keeps the machine awake while the command runs.

## Install

Run the repository installer from its root:

```sh
./install.sh
```

The installer installs zsh and Git with Homebrew, clones Oh My Zsh if needed,
backs up an existing `~/.zshrc`, then links `zsh/.zshrc` to `~/.zshrc`.

## Secrets

Secrets are stored outside the repository in
`~/.config/dotfiles/zsh/secrets.zsh`, with permissions set to `600`.

On the first install, known token exports are migrated from the previous
`~/.zshrc` into that file. On a new machine, the installer creates an empty
file from `secrets.zsh.example`; fill in only the values needed locally.

Never add token values to `.zshrc`, `secrets.zsh.example`, or Git.
