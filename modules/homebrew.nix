{ ... }:
{
  homebrew = {
    enable = true;

    onActivation.cleanup = "uninstall";

    taps = [
      "homebrew/cask-fonts"
      "koekeishiya/formulae"
    ];

    casks = [
      "docker"
      "flameshot"
      "font-caskaydia-cove-nerd-font"
      "font-fira-code-nerd-font"
      "font-hack-nerd-font"
      "hammerspoon"
      "jetbrains-toolbox"
      "libreoffice"
      "linearmouse"
      "raycast"
    ];

    brews = [
      "bob"
      # TODO: Migrate to Nix-Darwin version, it currently crashes though
      "yabai"
    ];
  };
}