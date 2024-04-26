{pkgs, ...}: {
  home.packages = [
    pkgs.lua5_4_compat
    pkgs.lua54Packages.luarocks
  ];
}
