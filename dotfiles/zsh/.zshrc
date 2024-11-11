# Check if we're on macOS
SYSTEM="$(uname -s)"
IS_DARWIN=0

if [ "$SYSTEM" = "Darwin"]
then
    IS_DARWIN=1
fi

# Aliases
alias a="php artisan"
alias cat="bat --color=always"
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias lg="lazygit"
alias ll="eza -lag --header"
alias ls="eza -lag --header"

# Set up NVM
if [ "$IS_DARWIN" = 1 ]
then
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

# Fix moving forwards and backwards between words with Opt + Arrow
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

if [ "$IS_DARWIN" = 1 ]
then
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

    FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"

    autoload -Uz compinit
    compinit
fi
