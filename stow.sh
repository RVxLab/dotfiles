#!/usr/bin/env bash

set -euo pipefail

run_stow () {
    $(which stow) -d dotfiles -t "$HOME" alacritty tmux vim
}

if [[ "$0" == "$BASH_SOURCE" ]]
then
    run_stow
fi
