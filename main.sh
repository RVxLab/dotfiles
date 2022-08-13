#!/usr/bin/env bash

set -euo pipefail

if [[ "$0" != "$BASH_SOURCE" ]]
then
    echo "main.sh should not be sourced, run it with 'bash main.sh'"
    exit 0
fi


. util.sh
. brew.sh
. fonts.sh
. stow.sh

# Print the banner (it's pretty)
echo
banner "Installing and setting up MacOS packages" "="
echo

if ! check_brew
then
    install_brew

    if ! check_brew
    then
        echo "Could not determind if Homebrew was correctly installed. Fix this and then run the script again"
        exit 100
    fi
fi

log "Installing Homebrew Formulae"
install_formulae

log "Installing Homebrew Casks"
install_casks

log "Installing Cascadia Code"
download_cascadia_code

log "Running Stow"
run_stow
