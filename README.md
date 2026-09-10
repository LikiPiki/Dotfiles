# Dotfiles

Personal configuration files for command-line tools.

## Install

Run the installer from the repository root:

```sh
./install.sh
```

To install only selected tools, pass their directory names:

```sh
./install.sh tmux
./install.sh nvim
./install.sh zsh
```

The root installer delegates to each configured tool installer. Each tool
directory documents its installation steps and dependencies.

## Installer Architecture

`install.sh` in the repository root is an orchestrator. It runs the installers
listed in its `installers` array, currently `nvim`, `tmux`, and `zsh`. With no
arguments it runs them all; passed names select only those installers.

Each tool owns its configuration, README, and `install.sh` inside its own
directory. To add a new tool:

1. Create a directory for it, for example `zsh/`.
2. Put its configuration and `<tool>/install.sh` in that directory.
3. Add `<tool>/install.sh` to the root `installers` array.
4. Add the tool to the Contents list below.

## Contents

- [`nvim/`](nvim/): Neovim configuration with LSP, completion, snippets, and formatting.
- [`tmux/`](tmux/): tmux configuration with Catppuccin, system indicators, and fuzzy session switching.
- [`zsh/`](zsh/): Oh My Zsh configuration, aliases, and local secret handling.

Each directory contains setup instructions for its tool.
