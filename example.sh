#!/usr/bin/env bash

set -euo pipefail

run_script () {
    echo "Do something"
}

if [[ "$0" == "$BASH_SOURCE" ]]
then
    run_script
fi
