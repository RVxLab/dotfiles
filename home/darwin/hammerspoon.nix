{ config, ... }:
{
  home.file.".hammerspoon".source = config.lib.file.mkOutOfStoreSymlink ../../dotfiles/hammerspoon;
}
