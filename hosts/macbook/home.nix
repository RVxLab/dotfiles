{ username, ... }:
{
  home = {
    inherit username;
    homeDirectory = "/Users/${username}";
    stateVersion = "23.11";

    # Additional PATHs
    sessionPath = [
      "$HOME/.local/share/bob/nvim-bin"
    ];
  };

  # Allow Home Manager to install and manage itself
  programs.home-manager.enable = true;
}
