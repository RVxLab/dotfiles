# Rebuild the system
default:
    #!/usr/bin/env bash
    set -euo pipefail

    OS_NAME="$(uname)"
    case "$OS_NAME" in
        Darwin) darwin-rebuild switch --flake "$PWD"#macbook ;;
        *) echo "Not sure how to support $OS_NAME" && exit 1 ;;
    esac

