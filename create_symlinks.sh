#!/bin/bash

# Define an associative array of source and target directories
declare -A symlinks=(
    ["~/.dotfiles/alacritty"]="~/.config/alacritty"
    ["~/.dotfiles/cmus"]="~/.config/cmus"
    ["~/.dotfiles/i3"]="~/.config/i3"
    ["~/.dotfiles/i3status"]="~/.config/i3status"
    ["~/.dotfiles/lf"]="~/.config/lf"
    ["~/.dotfiles/nvim"]="~/.config/nvim"
    ["~/.dotfiles/.bashrc"]="~/.bashrc"
)

# Create symlinks
for src in "${!symlinks[@]}"; do
    target="${symlinks[$src]}"

    # Expand the paths
    src=$(eval echo "$src")
    target=$(eval echo "$target")

    # Check if the target already exists
    if [ -e "$target" ]; then
        echo "Removing existing '$target'"
        rm -rf "$target"
    fi

    # Create the symlink
    ln -s "$src" "$target" && echo "Created symlink: $target -> $src" || echo "Failed to create symlink: $target"
done

echo "All symlinks processed."

