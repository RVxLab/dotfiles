{ username, ... }:
{
  home = {
    inherit username;
    homeDirectory = "/Users/${username}";
    stateVersion = "23.11";
  };

  # Allow Home Manager to install and manage itself
  programs.home-manager.enable = true;
}
