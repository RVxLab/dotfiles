# Zsh settings
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Check if we're on macOS
SYSTEM="$(uname -s)"
IS_DARWIN=0

if [ "$SYSTEM" = "Darwin" ]
then
    IS_DARWIN=1
fi

# Set up default editor
EDITOR="nvim"

# Aliases
alias a="php artisan"
alias cat="bat --color=always"
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias lg="lazygit"
alias ll="eza -lag --header"
alias ls="eza -lag --header"

# When on macOS...
if [ "$IS_DARWIN" = 1 ]
then
    # Set up NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

    # Set up Bob
    eval "$(bob complete zsh)"
    export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"

    # Set up Docker
    export PATH="$PATH:$HOME/.docker/bin"

    # Ensure XDG_CONFIG_HOME is set up if it isn't
    if [ -z "$XDG_CONFIG_HOME" ]
    then
        export XDG_CONFIG_HOME="$HOME/.config"
    fi

    # Set the Brewfile location
    export HOMEBREW_BUNDLE_FILE_GLOBAL="$HOME/.dotfiles/Brewfile"
fi

# Initialize Starship
eval "$(starship init zsh)"

# Fzf
source <(fzf --zsh)

# Zoxide
eval "$(zoxide init zsh)"

# Fix moving forwards and backwards between words with Opt + Arrow
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Set up ZSH things
if [ "$IS_DARWIN" = 1 ]
then
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

    FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"

    autoload -Uz compinit
    compinit
fi

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/"

# Herd injected PHP binary.
export PATH="$HOME/Library/Application Support/Herd/bin/:$PATH"
