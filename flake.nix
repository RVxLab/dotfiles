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
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager } @ inputs:
  let
    # Set the Git commit hash for darwin-version
    system.configurationRevision = self.rev or self.dirtyRev or null;

  in {
    # Define the MacOS System
    darwinConfigurations.macbook = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        home-manager.darwinModules.home-manager
        ./hosts/macbook
        ./modules/common
        ./modules/darwin
      ];
      specialArgs = {
        vars = (import ./host.nix) // {
          nvimPath = "~/.local/share/bob/nvim-bin/nvim";
        };
      };
    };
  };
}
