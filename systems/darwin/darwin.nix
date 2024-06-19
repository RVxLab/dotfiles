{
  vars,
  nixpkgs,
  ...
}: {
  # Let nixpkgs know this is a Mac
  nixpkgs.hostPlatform = vars.system;

  # Allow management of the shell
  programs.zsh.enable = true;

  # Used for backwards compatibility, check `darwin-rebuild changelog` before changing this
  system.stateVersion = 4;

  # Make sure the hostname and computer name are set correctly
  networking = {
    hostName = vars.hostname;
    computerName = vars.hostname;
  };
}
