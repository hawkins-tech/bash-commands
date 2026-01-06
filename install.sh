#!/bin/bash
# Installation script for bash-commands
# Usage: curl -sSL https://raw.githubusercontent.com/hawkins-tech/bash-commands/main/install.sh | bash

set -e

REPO_URL="https://github.com/hawkins-tech/bash-commands"
INSTALL_DIR="/usr/local/bin"
TEMP_DIR=$(mktemp -d)

echo "==================================="
echo "bash-commands installer"
echo "==================================="
echo ""

# Check if running with sudo/root for system-wide install
if [ "$EUID" -ne 0 ]; then 
  echo "Note: This script requires sudo privileges to install to $INSTALL_DIR"
  echo "You may be prompted for your password."
  echo ""
fi

echo "Downloading bash-commands..."
cd "$TEMP_DIR"

# Try to download using git if available, otherwise use curl/wget
if command -v git &> /dev/null; then
  git clone --depth 1 "$REPO_URL" bash-commands
  cd bash-commands
else
  echo "Error: git is required for installation"
  echo "Please install git and try again"
  exit 1
fi

echo ""
echo "Installing commands to $INSTALL_DIR..."

# Install each command from bin/
for cmd in bin/*; do
  if [ -f "$cmd" ] && [ -x "$cmd" ]; then
    CMD_NAME=$(basename "$cmd")
    echo "  Installing $CMD_NAME..."
    sudo cp "$cmd" "$INSTALL_DIR/$CMD_NAME"
    sudo chmod +x "$INSTALL_DIR/$CMD_NAME"
  fi
done

echo ""
echo "Cleaning up..."
rm -rf "$TEMP_DIR"

echo ""
echo "==================================="
echo "Installation complete!"
echo "==================================="
echo ""
echo "The following commands are now available:"
echo "  - killgrep <name>    : Kill processes matching a name pattern"
echo "  - always <command>   : Keep retrying a command until it succeeds"
echo "  - execs              : List all executable files in PATH"
echo ""
echo "Try running 'execs' to see all available executables!"
