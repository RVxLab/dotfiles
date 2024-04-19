{ pkgs, vars, ... }:
{
  # Allow Nix to manage itself
  services.nix-daemon.enable = true;

  # Nix config
  nix = {
    package = pkgs.nix;

    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        "root"
        vars.username
      ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };
}
