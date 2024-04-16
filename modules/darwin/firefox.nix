{ vars, ... }:
{
  # Don't install Firefox on MacOS, let Homebrew manage it
  home-manager.users.${vars.username}.programs.firefox.package = null;
}
