{...}: {
  homebrew = {
    enable = true;

    onActivation.cleanup = "uninstall";

    taps = [
      "homebrew/cask-fonts"
      "koekeishiya/formulae"
    ];

    casks = [
      "docker"
      "firefox"
      "flameshot"
      "font-caskaydia-cove-nerd-font"
      "font-fira-code-nerd-font"
      "font-hack-nerd-font"
      "font-jetbrains-mono-nerd-font"
      "hammerspoon"
      "jetbrains-toolbox"
      "libreoffice"
      "linearmouse"
      "raycast"
      "via"
      "vivaldi"
    ];

    brews = [
      "silicon"
      "yabai"
    ];

    masApps = {
      Tailscale = 1475387142;
    };
  };
}
