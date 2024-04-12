{ nixpkgs, nix-darwin, home-manager, username, hostname }:
nix-darwin.lib.darwinSystem {
  system = "aarch64-darwin";

  modules = [
    ../../modules/common
    ../../modules/darwin
    # Add Home Manager
    home-manager.darwinModules.home-manager
    {
      # Create /etc/zshrc to load nix-darwin
      programs.zsh.enable = true;

      # Used for backwards compatibility, check `darwin-rebuild changelog` before changing this
      system.stateVersion = 4;

      # This is an arm64 Mac
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Set hostname
      networking = {
        hostName = hostname;
        computerName = hostname;
      };

      # Set up the user
      users.users.${username} = {
        home = "/Users/${username}";
      };

      # Set up Home Manager
      home-manager = {
        useGlobalPkgs = true; # Use system nixpkgs instead of Home Manager's
        useUserPackages = true; # Install packages to /etc/profiles
        users.${username} = import ./home.nix;
      };

      # Enable Homebrew integration
      homebrew = {
        enable = true;
      };
    }
  ];
}
