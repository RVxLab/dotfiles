#!/usr/bin/env bash

set -euo pipefail

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

