function rgb2hex {
    local R="${1-}"
    local G="${2-}"
    local B="${3-}"
    local A="${4-255}"

    if [ -z "$R" -o -z "$G" -o -z "$B" ]
    then
        echo "Usage: rgb2hex <red> <green> <blue> [alpha=255]"
        return 1
    fi

    printf '0x%02x%02x%02x%02x' "$A" "$R" "$G" "$B"
}


BLACK=$(rgb2hex 0 0 0)
WHITE=$(rgb2hex 255 255 255)

