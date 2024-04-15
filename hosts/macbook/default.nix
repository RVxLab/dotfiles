{ nixpkgs, nix-darwin, home-manager, vars, ... }:
{
  # Allow nix to manage shells
  programs.zsh.enable = true;

  # Used for backwards compatibility, check `darwin-rebuild changelog` before changing this
  system.stateVersion = 4;

  # This is an arm64 Mac
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Add user to Nix trusted users
  nix.settings.trusted-users = [
    "root"
    vars.username
  ];

  # Set hostname
  networking = {
    hostName = vars.hostname;
    computerName = vars.hostname;
  };

  # Set up the user
  users.users.${vars.username} = {
    home = "/Users/${vars.username}";
  };

  # Set up Home Manager
  home-manager = {
    useGlobalPkgs = true; # Use system nixpkgs instead of Home Manager's
    useUserPackages = true; # Install packages to /etc/profiles
    users.${vars.username} = import ./home.nix;
  };

  # Enable Homebrew integration
  homebrew = {
    enable = true;
  };

  # Allow usage of TouchID for sudo
  security.pam.enableSudoTouchIdAuth = true;
}
