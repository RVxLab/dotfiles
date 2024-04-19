{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Basics
    curl
    wget

    # General CLI utils
    bat # Better cat
    btop # Fancy top
    eza # Better ls
    dust # Better du
    fd # Better find
    httpie # User-friendly HTTP tool
    just # Task runner
    jq # JSON manipulation
    neofetch # Show system info
    ripgrep # Better grep
    tre-command # Better tree
    zoxide # Jump to known directories

    # Git
    difftastic # Diff and with syntax highlighting
    delta # Git pager
    lazygit # Git CLI tool

    # Shell
    starship

    # Useful programs
    ffmpeg
  ];
}
