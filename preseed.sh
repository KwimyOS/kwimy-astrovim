#!/usr/bin/env bash
set -euo pipefail

if ! command -v nvim >/dev/null 2>&1; then
  echo "nvim not found; install neovim first" >&2
  exit 1
fi

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_dir="$repo_dir/config"

if [[ ! -d "$config_dir" ]]; then
  echo "config/ not found in $repo_dir" >&2
  exit 1
fi

export XDG_CONFIG_HOME="$repo_dir/.tmp/config"
export XDG_DATA_HOME="$repo_dir/.tmp/share"
export XDG_STATE_HOME="$repo_dir/.tmp/state"

rm -rf "$repo_dir/.tmp"
mkdir -p "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME"
cp -a "$config_dir" "$XDG_CONFIG_HOME/nvim"

nvim --headless "+Lazy! sync" +qa

rm -rf "$repo_dir/skel"
mkdir -p "$repo_dir/skel/.local/share" "$repo_dir/skel/.local/state"
cp -a "$XDG_DATA_HOME/nvim" "$repo_dir/skel/.local/share/"
cp -a "$XDG_STATE_HOME/nvim" "$repo_dir/skel/.local/state/"

rm -rf "$repo_dir/.tmp"

echo "Preseed complete. Updated skel/.local/share/nvim and skel/.local/state/nvim."
