# Check if we're on macOS
set -l system "$(uname -s)"

if test "$system" = "Darwin"
    set -f is_darwin 1
else
    set -f is_darwin 0
end

# Abbreviations
abbr -a a php artisan
abbr -a lg lazygit
abbr -a fzf fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
abbr -a ll eza -lag --header
abbr -a s kitten ssh
abbr -a bb brew bundle --global

# Add path
fish_add_path "$HOME/bin" "$HOME/.volta/bin"

# Ripgrep's config location
set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/.ripgreprc"

# Add paths only on macOS
if test "$is_darwin" = 1
    fish_add_path "$HOME/.docker/bin"

    # Add XDG_CONFIG if it's not already set
    if test -z "$XDG_CONFIG_HOME"
        set -gx XDG_CONFIG_HOME "$HOME/.config"
    end

    # Homebrew
    fish_add_path "/opt/homebrew/bin"
    set -gx HOMEBREW_BUNDLE_FILE_GLOBAL "$HOME/.dotfiles/Brewfile"

    # Laravel Herd
    set -gx HERD_PHP_83_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/83"
    set -gx HERD_PHP_84_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/84"

    fish_add_path "$HOME/Library/Application Support/Herd/bin"
end

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
fish_add_path "$PNPM_HOME"
# pnpm end

# Interactive stuff
if status is-interactive
    # Initialize CLI tooling
    starship init fish | source
    fzf --fish | source
    zoxide init fish | source
    direnv hook fish | source

    if test "$is_darwin" = 1
        bob complete fish | source
        fish_add_path "$HOME/.local/share/bob/nvim-bin"
    end
end

# Set up defaults
set -gx EDITOR "$(which nvim)"
set -gx SHELL "$(which fish)"
