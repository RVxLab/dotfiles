{ pkgs, ... }:
{
  home.packages = [
    pkgs.difftastic
    pkgs.delta
    pkgs.lazygit
  ];
}
