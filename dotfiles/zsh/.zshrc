# Aliases
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias mkdir="mkdir -p"
alias h="history"
alias ls="exa -lag --header"
alias ll="ls"
alias cat="bat"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Set up PATH
export PATH="$PATH:$HOME/bin:/opt/homebrew/bin:$HOME/.cargo/bin"

# Init Starship
eval "$(starship init zsh)"

