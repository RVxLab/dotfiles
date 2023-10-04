#!/usr/bin/env bash

set -euo pipefail

# Utility functions
banner () {
    local TEXT="$1"
    local TEXT_LENGTH=${#TEXT}
    local SURROUND_CHAR="${2:-=}"
    local COLUMNS=$(tput cols)
    local COLUMNS_PADDED=$(( COLUMNS - 2 ))

    local TEXT_PADDING_LENGTH=$(( (COLUMNS_PADDED - TEXT_LENGTH - 4 ) / 2 ))

    local TEXT_PADDING=$(repeat "=" $TEXT_PADDING_LENGTH)
    local BANNER_LINE=$(repeat "=" $COLUMNS_PADDED)

    echo " $BANNER_LINE"
    echo " $TEXT_PADDING  $TEXT  $TEXT_PADDING"
    echo " $BANNER_LINE"
}

repeat () {
    local CHAR="$1"
    local END=$2

    for i in $(seq 1 $END)
    do
        echo -n "$CHAR"
    done
}

log () {
    local DATE=$(date "+%Y-%m-%d %H:%M:%S")

    echo "[$DATE] $@"
}

# Homebrew
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

# Terminfo to have Alacritty work better with multiplexers
# This is required for Tmux and _maybe_ for Zellij, not sure
install_terminfo () {
    local TERMINFO=(
        "alacritty-direct"
        "tmux-256color"
    )
    local TERMINFO_STR="$(IFS=, ; echo "${TERMINFO[*]}")"

    echo "Entering /tmp"
    pushd /tmp

    echo "Downloading and gunzipping terminfo"
    rm -f terminfo.src terminfo.src.gz
    /usr/bin/curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && /usr/bin/gunzip terminfo.src.gz

    echo "Installing terminfo, requires sudo"
    sudo /usr/bin/tic -xe "$TERMINFO_STR" terminfo.src

    for TINFO in ${TERMINFO[@]}
    do
        echo "Checking if $TINFO is installed"
        if ! /usr/bin/infocmp -x "$TINFO" > /dev/null
        then
            echo "$TINFO is not installed"
        fi
    done

    popd
}

# Stow
run_stow () {
    local STOW=$(which stow)
    local STOWABLES=$(/bin/ls ./dotfiles)

    "$STOW" -d dotfiles -t "$HOME" $STOWABLES
}

# Git
setup_git_config () {
    git config --global init.defaultBranch "main"
    git config --global core.editor "nvim"
    git config --global core.excludesFile "$HOME/.gitignore"
    git config --global core.pager "delta"
    git config -t bool --global push.autoSetupRemote true
    git config -t bool --global branch.autoSetupMerge true
    git config --global interactive.diffFilter "delta --color-only"
    git config -t bool --global delta.navigate true
    git config -t bool --global delta.light false
    git config -t bool --global delta.side-by-side true
    git config --global merge.conflictStyle "diff3"
    git config --global diff.colorMoved = "default"
}

# Main
main () {
    echo
    banner "Setting up MacOS"
    echo

    log "Checking for Homebrew"
    check_brew || install_brew

    log "Installing Homebrew packages from Brewfile"
    "$(which brew)" bundle install

    log "Installing Terminfo for Alacritty"
    install_terminfo

    log "Running Stow"
    run_stow

    log "Setting up base git config"
    setup_git_config
}

if [[ "$0" = "$BASH_SOURCE" ]]
then
    main
fi

