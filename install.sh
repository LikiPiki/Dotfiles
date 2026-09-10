#!/usr/bin/env bash

set -euo pipefail

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
installers=(
    "nvim"
    "tmux"
    "zsh"
)

if [ "$#" -gt 0 ]; then
    installers=("$@")
fi

for installer in "${installers[@]}"; do
    case "$installer" in
        nvim|tmux|zsh) ;;
        *)
            printf 'Unknown installer: %s\n' "$installer" >&2
            exit 1
            ;;
    esac

    printf 'Installing %s\n' "$installer"
    "$repo_dir/$installer/install.sh"
done
