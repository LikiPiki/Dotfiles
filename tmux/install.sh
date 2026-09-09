#!/usr/bin/env bash

set -euo pipefail

tmux_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
tmux_config_source="$tmux_dir/.tmux.conf"
tmux_config_target="$HOME/.tmux.conf"
tpm_dir="$HOME/.tmux/plugins/tpm"

if ! command -v brew >/dev/null 2>&1; then
    printf 'Homebrew is required. Install it from https://brew.sh/ and run this script again.\n' >&2
    exit 1
fi

brew install tmux fzf sesh git

if [ -e "$tmux_config_target" ] || [ -L "$tmux_config_target" ]; then
    if [ "$(readlink "$tmux_config_target" 2>/dev/null || true)" != "$tmux_config_source" ]; then
        backup="$tmux_config_target.backup.$(date +%Y%m%d%H%M%S)"
        mv "$tmux_config_target" "$backup"
        printf 'Backed up existing tmux configuration to %s\n' "$backup"
    fi
fi

ln -sfn "$tmux_config_source" "$tmux_config_target"

mkdir -p "$HOME/.tmux/plugins"

if [ ! -d "$tpm_dir" ]; then
    git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
fi

tmux start-server
tmux source-file "$tmux_config_target"
"$tpm_dir/bin/install_plugins"

printf 'tmux is installed and configured. Start a new tmux session to use it.\n'
