# Neovim

This configuration uses lazy.nvim for plugins, built-in LSP support, nvim-cmp,
Tree-sitter, and Conform formatting.

## Install

Run the repository installer from its root:

```sh
./install.sh nvim
```

The installer installs Neovim with Homebrew, backs up an existing
`~/.config/nvim` directory, and links this directory in its place. Start
Neovim afterwards to install lazy.nvim and the configured plugins.
