{ ... }:
{
  homebrew = {
    enable = true;

    # Uncomment when finishing migration to Nix
    # onActivation.cleanup = "uninstall";

    taps = [
      "homebrew/cask-fonts"
    ];

    casks = [
      "arc"
      "firefox"
      "docker"
      "font-caskaydia-cove-nerd-font"
      "font-hack-nerd-font"
      "jetbrains-toolbox"
      "karabiner-elements"
      "kitty"
      "libreoffice"
      "linearmouse"
      "obsidian"
      "raycast"
    ];
  };
}
