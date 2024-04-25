{pkgs, ...}: {
  home.packages = [
    pkgs.bat
    pkgs.curl
    pkgs.eza
    pkgs.dust
    pkgs.fd
    pkgs.htop
    pkgs.httpie
    pkgs.just
    pkgs.jq
    pkgs.neofetch
    pkgs.p7zip
    pkgs.ripgrep
    pkgs.tre-command
    pkgs.wget
    pkgs.zoxide
  ];
}
