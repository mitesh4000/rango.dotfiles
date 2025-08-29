#!/usr/bin/env bash

# Backup script for NixOS configuration files
# Usage: ./nixos-backup.sh "Commit message here"

# Configuration - EDIT THESE PATHS TO MATCH YOUR SETUP
CONFIG_DIR="/etc/nixos"
GIT_REPO_DIR="/home/rango/.dotfiles"  # Change this to your actual git repo path

# Files to backup
FILES=("configuration.nix" "hardware-configuration.nix")

# Check if we're running as root (needed to access /etc/nixos)
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root to access /etc/nixos"
    exit 1
fi

# Check if git repo directory exists
if [ ! -d "$GIT_REPO_DIR" ]; then
    echo "Git repository directory does not exist: $GIT_REPO_DIR"
    echo "Please update the GIT_REPO_DIR variable in this script"
    exit 1
fi

# Copy files
echo "Copying configuration files to Git repository..."
for file in "${FILES[@]}"; do
    if [ -f "$CONFIG_DIR/$file" ]; then
        cp -v "$CONFIG_DIR/$file" "$GIT_REPO_DIR/nixos"
    else
        echo "Warning: $CONFIG_DIR/$file does not exist"
    fi
done

# Check if any files were changed
cd "$GIT_REPO_DIR" || exit 1
if git diff --quiet --exit-code; then
    echo "No changes detected in configuration files"
    exit 0
fi

# Create git commit
if [ -z "$1" ]; then
    COMMIT_MSG="Update NixOS configuration $(date +%Y-%m-%d)"
else
    COMMIT_MSG="$1"
fi

git add .
git commit -m "$COMMIT_MSG"

echo "Backup complete! Changes committed with message: '$COMMIT_MSG'"
echo "Don't forget to push to your remote repository: git push"
