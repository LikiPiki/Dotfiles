#!/usr/bin/env bash

set -euo pipefail

nvim_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
nvim_config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
nvim_config_target="$nvim_config_dir/nvim"

if ! command -v brew >/dev/null 2>&1; then
    printf 'Homebrew is required. Install it from https://brew.sh/ and run this script again.\n' >&2
    exit 1
fi

brew install neovim
mkdir -p "$nvim_config_dir"

if [ -e "$nvim_config_target" ] || [ -L "$nvim_config_target" ]; then
    if [ "$(readlink "$nvim_config_target" 2>/dev/null || true)" != "$nvim_dir" ]; then
        backup="$nvim_config_target.backup.$(date +%Y%m%d%H%M%S)"
        mv "$nvim_config_target" "$backup"
        printf 'Backed up existing Neovim configuration to %s\n' "$backup"
    fi
fi

ln -sfn "$nvim_dir" "$nvim_config_target"

printf 'Neovim is installed and configured. Start Neovim to install plugins.\n'
