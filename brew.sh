#!/usr/bin/env bash

. ./util.sh

check_brew () {
    local BREW_PATH="$(which brew)"

    if [[ -n "$BREW_PATH" ]]
    then
        echo "Found brew at $BREW_PATH"

        return 0
    fi

    return 1
}

install_brew () {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_formulae () {
    OIFS="$IFS"
    IFS=$'\n' FORMULAE=( $(< formulae.txt) )
    IFS="$OIFS"

    $(which brew) install "${FORMULAE[@]}"
}

install_casks () {
    OIFS="$IFS"
    IFS=$'\n' CASKS=( $(< casks.txt) )
    IFS="$OIFS"

    local FAILED_CASKS=()

    for CASK in "${CASKS[@]}"
    do
        if ! $(which brew) install --casks "$CASK"
        then
            FAILED_CASKS+=("$CASK")
        fi
    done

    if [[ ${#FAILED_CASKS[@]} -gt 0 ]]
    then
        echo "Some casks failed to install: ${FAILED_CASKS[@]}"
    fi
}

if [[ "$0" == "$BASH_SOURCE" ]]
then
    if ! check_brew
    then

        install_brew
        
        if ! check_brew
        then
            echo "Could not determind if Homebrew was installed ('which brew' failed), verify manually and re-run script"
            exit 100
        fi
    fi

    install_formulae

    install_casks
fi

