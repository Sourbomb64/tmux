#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting tmux environment setup..."

# Prompt for installation directory
DEFAULT_DIR="$HOME/.config/tmux"
read -p "Where do you want to install your tmux config? [$DEFAULT_DIR]: " USER_INPUT

TARGET_DIR=${USER_INPUT:-$DEFAULT_DIR}
TARGET_DIR="${TARGET_DIR/#\~/$HOME}"

if [[ ! "$TARGET_DIR" =~ ^((\|/)[a-zA-Z0-9._-]+)+/?$ ]]; then
    echo "Path is invalid, try again."
    exit 1
fi

echo "Target directory is set to: $TARGET_DIR"

# Check for existing config
if [ -f "$HOME/.tmux.conf" ]; then
    echo "Warning: existing ~/.tmux.conf found."
    echo "Tmux prioritizes ~/.tmux.conf over ~/.config/tmux/tmux.conf."
    echo "Consider running: mv ~/.tmux.conf ~/.tmux.conf.bak"
    echo "------------------------------------------------------"
fi

# Check if target directory exists, abort if true
if [ -d "$TARGET_DIR" ]; then
    echo "Directory $TARGET_DIR already exists."
    echo "I don't want to overwrite anything. exiting"
    exit 1
fi

mkdir -p "$TARGET_DIR"

echo "Cloning configuration repository..."
git clone https://github.com/Sourbomb64/tmux.git "$TARGET_DIR"

# 4. Inject the chosen path into the tmux.conf file dynamically
# This finds the TMUX_BASE_PATH line and replaces it with the actual path chosenS
sed -i.bak "s|^TMUX_BASE_PATH=.*|TMUX_BASE_PATH=\"$TARGET_DIR\"|" "$TARGET_DIR/tmux.conf"
rm -f "$TARGET_DIR/tmux.conf.bak" # Clean up sed backup file

echo "Cloning Tmux Plugin Manager (TPM)..."
git clone https://github.com/tmux-plugins/tpm "$TARGET_DIR/plugins/tpm"

echo "Setup complete. You can now launch tmux."
echo "Now let TPM handled the right with 'prefix + I'."
