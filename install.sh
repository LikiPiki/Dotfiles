#!/usr/bin/env bash

set -euo pipefail

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
installers=(
    "tmux/install.sh"
)

for installer in "${installers[@]}"; do
    printf 'Installing %s\n' "${installer%/install.sh}"
    "$repo_dir/$installer"
done
