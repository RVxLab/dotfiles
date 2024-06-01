{pkgs, ...}: {
  home.packages = [
    pkgs.rustup
    pkgs.cargo-watch
    pkgs.cargo-nextest
  ];
}
