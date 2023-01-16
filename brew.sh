#!/usr/bin/env bash

set -euo pipefail

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

install_from_brewfile () {
    local BREW="$(which brew)"

    $BREW bundle install
}

if [[ "$0" == "$BASH_SOURCE" ]]
then
    if ! check_brew
    then

        install_brew

        if ! check_brew
        then
            echo "Could not determine if Homebrew was installed ('which brew' failed), verify manually and re-run script"
            exit 100
        fi
    fi

    install_from_brewfile
fi

