{ vars, ... }:
{
  home = {
    username = vars.username;
    homeDirectory = vars.homeDirectory;

    stateVersion = "23.11";

    # Additional PATHs
    sessionPath = [
      "$HOME/.local/share/bob/nvim-bin"
      "$HOME/.composer/vendor/bin"
    ];
  };
}
