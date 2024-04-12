{ pkgs, ... }:
{
  # Allow Nix to manage itself
  services.nix-daemon.enable = true;

  # Nix config
  nix = {
    package = pkgs.nix;
    settings.experimental-features = "nix-command flakes";
  };
}
