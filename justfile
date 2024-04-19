# Rebuild the system
default:
    #!/usr/bin/env bash
    set -euo pipefail

    OS_NAME="$(uname)"
    case "$OS_NAME" in
        Darwin) just darwin-rebuild-switch ;;
        *) echo "Not sure how to support $OS_NAME" && exit 1 ;;
    esac

# Rebuild using darwin-rebuild and apply the changes
darwin-rebuild-switch:
    #!/usr/bin/env bash
    set -euo pipefail

    if command -v darwin-rebuild > /dev/null
    then
        darwin-rebuild switch --flake "$PWD"#macbook
        exit 0
    fi

    echo "darwin-rebuild not found, using nix run instead"
    nix run nix-darwin -- switch --flake "$PWD"#macbook

# Rebuild using darwin-rebuild but don't apply the changes
darwin-rebuild-build:
    #!/usr/bin/env bash
    set -euo pipefail

    if command -v darwin-rebuild > /dev/null
    then
        darwin-rebuild build --flake "$PWD"
        exit 0
    fi

    echo "darwin-rebuild not found, using nix run instead"
    nix run nix-darwin -- build --flake "$PWD"

# Run a repl
repl:
    nix repl

