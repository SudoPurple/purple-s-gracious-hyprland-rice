#!/usr/bin/env bash
set -euo pipefail

CONFIG="$HOME/.config/cava/config-waybar"
[[ -f "$CONFIG" ]] || exit 1

# 0..7 -> blocks
blocks=( "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" )

# Run cava and convert each frame to a Waybar JSON line
cava -p "$CONFIG" 2>/dev/null | while IFS= read -r line; do
  # keep only digits 0-7 (works even if cava uses separators)
  vals="$(printf '%s' "$line" | tr -cd '0-7')"

  out=""
  for ((i=0; i<${#vals}; i++)); do
    d="${vals:i:1}"
    out+="${blocks[$d]}"
  done

  printf '{"text":"%s","tooltip":false}\n' "$out"
done
