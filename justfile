system := `uname -s`

# Run installers
install:
    #!/usr/bin/env bash
    set -euo pipefail

    case {{ system }} in
        Darwin)
            bash ./install-macos.sh
            ;;
        *)
            echo "Unknown system, aborting"
            exit 1
            ;;
    esac

# Stow dotfiles
stow:
    #!/usr/bin/env bash
    set -euo pipefail

    case {{ system }} in
        Darwin)
            stow -R -d "$HOME/.dotfiles/dotfiles" -t "$HOME" bat fastfetch karabiner kitty lazygit skhd starship yabai yazi zsh
            ;;
        *)
            echo "Unknown system, aborting"
            exit 1
            ;;
    esac

# Run brew bundle
brew:
    brew bundle --file "$HOME/.dotfiles/Brewfile"
