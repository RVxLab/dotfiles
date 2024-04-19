{ pkgs, ... }:
{
  # Use banditthedoge's Firefox overlay package
  programs.firefox.package = pkgs.firefox-bin;
}
