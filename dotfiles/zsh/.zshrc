# Antigen

## Download Antigen if it doesn't exist yet
local ANTIGEN_HOME="$HOME/.antigen"

if [ ! -f "$ANTIGEN_HOME/antigen.zsh" ]
then
    echo "Downloading Antigen"
    /usr/bin/curl -sL git.io/antigen > "$ANTIGEN_HOME/antigen.zsh"
    echo "Downloaded Antigen to $ANTIGEN_HOME/antigen.zsh"
fi

if [ -f "$ANTIGEN_HOME/antigen.zsh" ]
then
    source $HOME/.antigen/antigen.zsh

    antigen bundle git
    antigen bundle zsh-users/zsh-completions
    antigen bundle zsh-users/zsh-syntax-highlighting # Must be last
    antigen apply
else
    echo "Antigen is not installed, check if the download script is correct"
fi

# Aliases
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias mkdir="mkdir -p"
alias h="history"
alias ls="eza -lag --header"
alias ll="ls"
alias cat="bat"
alias a="php artisan"
alias fzf="fzf --preview 'bat {}'"
alias lg="lazygit"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Set up PATH
export PATH="$PATH:$HOME/bin:$HOME/scripts"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/opt/homebrew/opt/libpq/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:$HOME/.docker/bin"
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"

# Init Starship
eval "$(starship init zsh)"

# Init Zoxide
eval "$(zoxide init zsh)"

# Fix word movement
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Add Fuzzyfinder extension
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

