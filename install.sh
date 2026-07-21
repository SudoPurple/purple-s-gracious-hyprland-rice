#!/usr/bin/env bash
# Installation & Symlink script for Hyprland Rice

set -euo pipefail

DOTFILES_DIR="$HOME/hyprland-rice"
CONFIG_DIR="$HOME/.config"
BIN_DIR="$HOME/.local/bin"

echo "=== Setting up Hyprland Rice Symlinks ==="

# Create a backup folder for existing configs (just in case)
backup_dir="$HOME/backup_configs_$(date +%Y%m%d_%H%M%S)"

# 1. Symlink config folders to ~/.config/
configs=(hypr waybar rofi kitty dunst matugen fastfetch fish)
for config in "${configs[@]}"; do
  target="$CONFIG_DIR/$config"
  source_dir="$DOTFILES_DIR/$config"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "Backing up existing config: $target"
    mkdir -p "$backup_dir"
    mv "$target" "$backup_dir/"
  elif [ -L "$target" ]; then
    echo "Removing old symlink: $target"
    rm "$target"
  fi

  echo "Linking config $config -> $target"
  ln -sf "$source_dir" "$target"
done

# 2. Symlink custom scripts to ~/.local/bin/
binaries=(rofi-cliphist rishot compress-video)
mkdir -p "$BIN_DIR"
for binary in "${binaries[@]}"; do
  target="$BIN_DIR/$binary"
  source_file="$DOTFILES_DIR/bin/$binary"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "Backing up existing binary: $target"
    mkdir -p "$backup_dir/bin"
    mv "$target" "$backup_dir/bin/"
  elif [ -L "$target" ]; then
    echo "Removing old symlink: $target"
    rm "$target"
  fi

  echo "Linking script $binary -> $target"
  ln -sf "$source_file" "$target"
done

echo "=== Setup complete! ==="
if [ -d "$backup_dir" ]; then
  echo "Your original files/configs were backed up to: $backup_dir"
fi
