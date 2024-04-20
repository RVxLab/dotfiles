{ pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.wezterm;
    extraConfig = builtins.readFile ../../dotfiles/wezterm/wezterm.lua;
  };
}
