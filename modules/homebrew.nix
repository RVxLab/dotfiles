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
      "docker"
      "font-caskaydia-cove-nerd-font"
      "font-hack-nerd-font"
      "jetbrains-toolbox"
      "karabiner-elements"
      "libreoffice"
      "linearmouse"
      "raycast"
    ];
  };
}
