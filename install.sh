#!/usr/bin/env bash
# Installation & Symlink script for Hyprland Rice

set -euo pipefail

DOTFILES_DIR="$HOME/hyprland-rice"
CONFIG_DIR="$HOME/.config"

echo "=== Setting up Hyprland Rice Symlinks ==="

# List of folders to symlink
configs=(hypr waybar rofi kitty dunst matugen fastfetch)

# Create a backup folder for existing configs (just in case)
backup_dir="$HOME/backup_configs_$(date +%Y%m%d_%H%M%S)"

for config in "${configs[@]}"; do
  target="$CONFIG_DIR/$config"
  source_dir="$DOTFILES_DIR/$config"

  # If target already exists and is not a symlink, back it up
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "Backing up existing config: $target"
    mkdir -p "$backup_dir"
    mv "$target" "$backup_dir/"
  elif [ -L "$target" ]; then
    echo "Removing old symlink: $target"
    rm "$target"
  fi

  # Create the symlink
  echo "Linking $config -> $target"
  ln -sf "$source_dir" "$target"
done

echo "=== Setup complete! ==="
if [ -d "$backup_dir" ]; then
  echo "Your original configs were backed up to: $backup_dir"
fi
