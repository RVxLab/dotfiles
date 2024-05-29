{
  description = "My MacOS setup";

  # `inputs` are the sources that will be loaded into the `output` function
  # The `follows` directive ensures that the referenced versions are the
  # same, so we can avoid version conflicts
  inputs = {
    # Main Nix package repo, we're using Unstable here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Nix Darwin so we can use Nix modules on MacOS
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager so we can manage users via Nix
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix User Repository
    nurpkgs.url = "github:nix-community/NUR";

    # Firefox addons
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim Nightly
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    nurpkgs,
    neovim-nightly,
    ...
  } @ inputs: let
    # Define the overlays
    darwinOverlays = [];

    overlays = [
      nurpkgs.overlay
    ];

    # Packages helper
    mkPkgs = system: overlays:
      import nixpkgs {
        inherit system overlays;
        config.allowUnfree = true;
      };

    # Helper to create a Darwin system
    darwinSystem = system: {
      hostname,
      username,
      ...
    }: let
      homeDirectory = "/Users/${username}";
      vars = {
        inherit hostname username system homeDirectory;
      };
    in
      nix-darwin.lib.darwinSystem {
        inherit system;
        pkgs = mkPkgs system (overlays ++ darwinOverlays);

        modules = [
          home-manager.darwinModules.home-manager
          ./systems/darwin
          ./modules/devenv.nix
          ./modules/home-manager.nix
          ./modules/homebrew.nix
          ./modules/nix.nix
          {
            users.users.${username} = {
              home = homeDirectory;
            };

            home-manager = {
              extraSpecialArgs = {
                inherit vars;
              };

              users.${username} = import ./home/darwin.nix;
            };
          }
        ];

        specialArgs = {inherit vars;};
      };

    # Set the Git commit hash for darwin-version
    system.configurationRevision = self.rev or self.dirtyRev or null;
  in {
    darwinConfigurations.macbook = darwinSystem "aarch64-darwin" (import ./host.nix);
  };
}
