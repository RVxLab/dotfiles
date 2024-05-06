{pkgs, ...}: {
  # Firefox doesn't work well on MacOS when installed through Nix (sadly)
  programs.firefox.enable = false;
}
