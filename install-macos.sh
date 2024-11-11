#!/usr/bin/env bash

set -euo pipefail

# Install Homebrew
if ! file /opt/homebrew/bin/brew > /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Allow TouchID for sudo (required after every macOS update)
sed "s/^#auth/auth/" /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local

# Autohide dock
defaults write com.apple.dock "autohide" -bool "true"

# Don't sort spaces by recently used (required for Yabai)
defaults write com.apple.dock "mru-spaces" -bool "false"

# Show all extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Show hidden files
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

# Restart the dock
killall Finder || true
