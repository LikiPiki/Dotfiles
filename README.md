# Dotfiles

Personal configuration files for command-line tools.

## Install

Run the installer from the repository root:

```sh
./install.sh
```

The root installer delegates to each configured tool installer. It currently
installs tmux and its dependencies, backs up an existing `~/.tmux.conf`, links
the tmux configuration from this repository, and installs its plugins.

## Installer Architecture

`install.sh` in the repository root is an orchestrator. It runs the installers
listed in its `installers` array, currently `tmux/install.sh`.

Each tool owns its configuration, README, and `install.sh` inside its own
directory. To add a new tool:

1. Create a directory for it, for example `zsh/`.
2. Put its configuration and `zsh/install.sh` in that directory.
3. Add `<tool>/install.sh` to the root `installers` array.
4. Add the tool to the Contents list below.

## Contents

- [`tmux/`](tmux/): tmux configuration with Catppuccin, system indicators, and fuzzy session switching.
- [`zsh/`](zsh/): Oh My Zsh configuration, aliases, and local secret handling.

Each directory contains setup instructions for its tool.
