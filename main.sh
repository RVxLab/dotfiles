#!/usr/bin/bash

set -euo pipefail

. util.sh
. brew.sh

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


