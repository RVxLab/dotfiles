#!/usr/bin/env bash

set -euo pipefail

install_caskaydia_cove () {
    $(which http) --follow -d -o "./temp/caskaydia-cove.zip" "$(http --follow -d https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest |  jq -r '.assets[] | select(.name == "CascadiaCode.zip") | .browser_download_url')"
    unzip -d ./temp/caskaydia-cove ./temp/caskaydia-cove.zip
    cp ./temp/caskaydia-cove/*.otf ~/Library/Fonts/
}

install_cascadia_code () {
    $(which http) --follow -d -o "./temp/cascadia-code.zip" "$(http --follow -d https://api.github.com/repos/microsoft/cascadia-code/releases/latest | jq -r '.assets[0].browser_download_url')"
    unzip -d ./temp/cascadia-code ./temp/cascadia-code.zip
    cp ./temp/cascadia-code/otf/static/*.otf ~/Library/Fonts/
}

if [[ "$0" == "$BASH_SOURCE" ]]
then
    install_cascadia_code
    install_caskaydia_cove
fi

