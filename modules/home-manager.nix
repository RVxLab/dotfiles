{...}: {
  home-manager = {
    useGlobalPkgs = true; # Use system nixpkgs instead of Home Manager's
    useUserPackages = true; # Install packages to /etc/profiles
  };
}
