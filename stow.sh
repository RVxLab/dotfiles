#!/usr/bin/env bash

set -euo pipefail

STOW=$(which stow)
LS="/bin/ls"

find_stowable () {
    $LS ./dotfiles
}

run_stow () {
    local FILES=$(find_stowable)

    $STOW -d dotfiles -t "$HOME" $FILES
}

if [[ "$0" == "$BASH_SOURCE" ]]
then
    run_stow
fi
