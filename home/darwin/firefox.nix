{pkgs, ...}: {
  # Disabled until I find a way to manage Firefox with Nix without it freezing on startup
  # Use banditthedoge's Firefox overlay package
  # programs.firefox.package = pkgs.firefox-bin;
}
