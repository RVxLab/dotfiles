{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Set up aliases
    shellAliases = {
      # General aliases
      ls = "eza -lag --header";
      ll = "eza -lag --header";
      cat = "bat";
      fzf = "fzf --preview 'bat {}'";
      lg = "lazygit";

      # PHP
      a = "php artisan";
    };

    initExtra = ''
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    '';
  };
}
