#!/usr/bin/env bash

set -euo pipefail

STARSHIP_CACHE_DIR="/tmp/starship-cache"
JSON_FILE="$STARSHIP_CACHE_DIR/laravel.json"

VERSION_NOT_FOUND="___VERS_NOT_FOUND___"

check_artisan() {
    if [ -f "$PWD/artisan" ] && [ -d "$PWD/vendor" ]
    then
        return 0
    else
        return 1
    fi
}

get_laravel_version() {
    php artisan --version | awk '{ print $3 }'
}

get_project_name() {
    basename "$PWD"
}

check_dependencies() {
    if ! command -v jq > /dev/null
    then
        return 1
    fi

    return 0
}

create_json_file_if_needed() {
    if [ ! -d "$STARSHIP_CACHE_DIR" ]
    then
        mkdir -p "$STARSHIP_CACHE_DIR"
    fi

    if [ ! -f "$STARSHIP_CACHE_DIR/laravel.json" ]
    then
        echo "{}" > "$JSON_FILE"
    fi
}

get_entry() {
    local NAME="${1-}"

    if [ -z "$NAME" ]
    then
        exit 2
    fi

    jq -r --arg notfound "$VERSION_NOT_FOUND" --arg key "$NAME" '.[$key] // $notfound' "$JSON_FILE"
}

update_entry() {
    local NAME="${1-}"

    if [ -z "$NAME" ]
    then
        exit 2
    fi

    local VERSION=$(get_laravel_version)
    local TMP_FILE=$(mktemp)

    jq --arg key "$NAME" --arg value "$VERSION" '.[$key] = $value' "$JSON_FILE" > "$TMP_FILE"
    mv -f "$TMP_FILE" "$JSON_FILE"

    echo "$VERSION"
}

did_version_change() {
    local NAME="${1-}"

    if [ -z "$NAME" ]
    then
        return 1
    fi

    if [ ! -f "composer.lock" ]
    then
        return 1
    fi

    local COMPOSER_CHECKSUM=$(jq -r '."content-hash"' "composer.lock")
    local CHECKSUM_FILE="$STARSHIP_CACHE_DIR/$NAME.checksum"
    local CHECKSUM=""

    if [ -f "$CHECKSUM_FILE" ]
    then
        local CHECKSUM=$(cat "$CHECKSUM_FILE")
    fi

    if [ "$COMPOSER_CHECKSUM" == "$CHECKSUM" ]
    then
        return 1
    fi

    echo "$COMPOSER_CHECKSUM" > "$CHECKSUM_FILE"

    return 0
}

if ! check_artisan
then
    # Not in a valid Laravel project
    exit 0
fi

if ! check_dependencies
then
    echo "Missing dependencies" >2
    exit 1
fi

NAME=$(get_project_name)

create_json_file_if_needed

if did_version_change "$NAME"
then
    CACHED_VERSION=$(get_laravel_version)
    update_entry "$NAME" > /dev/null &
else
    CACHED_VERSION=$(get_entry "$NAME")
fi

if [ "$CACHED_VERSION" = "$VERSION_NOT_FOUND" ]
then
    echo $(update_entry "$NAME")
else
    echo "$CACHED_VERSION"
fi
