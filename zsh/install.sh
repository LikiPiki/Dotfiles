#!/usr/bin/env bash

set -euo pipefail

zsh_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
zsh_config_source="$zsh_dir/.zshrc"
zsh_config_target="$HOME/.zshrc"
secrets_dir="${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/zsh"
secrets_file="$secrets_dir/secrets.zsh"

if ! command -v brew >/dev/null 2>&1; then
    printf 'Homebrew is required. Install it from https://brew.sh/ and run this script again.\n' >&2
    exit 1
fi

brew install zsh git

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
fi

mkdir -p "$secrets_dir"

if [ -e "$zsh_config_target" ] || [ -L "$zsh_config_target" ]; then
    if [ "$(readlink "$zsh_config_target" 2>/dev/null || true)" != "$zsh_config_source" ]; then
        backup="$zsh_config_target.backup.$(date +%Y%m%d%H%M%S)"
        mv "$zsh_config_target" "$backup"
        printf 'Backed up existing zsh configuration to %s\n' "$backup"

        if [ ! -f "$secrets_file" ]; then
            grep -E '^export (STARTREK|TANKER_API_TOKEN|AB_TOKEN|ELIZA_TOKEN|FIGMA_ACCESS_TOKEN|INTRASEARCH_TOKEN|STAFF_TOKEN|WIKI_TOKEN|YANDEX_CALENDAR_TOKEN)=' "$backup" > "$secrets_file" || true
            chmod 600 "$secrets_file"
            printf 'Migrated local secrets to %s\n' "$secrets_file"
        fi
    fi
fi

if [ ! -f "$secrets_file" ]; then
    install -m 600 "$zsh_dir/secrets.zsh.example" "$secrets_file"
    printf 'Created %s. Add local secret values before using dependent tools.\n' "$secrets_file"
fi

ln -sfn "$zsh_config_source" "$zsh_config_target"

printf 'zsh is installed and configured. Start a new shell to use it.\n'
