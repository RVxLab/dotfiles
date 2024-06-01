{
  pkgs,
  config,
  ...
}: {
  home.packages = [
    pkgs.difftastic
    pkgs.delta
    pkgs.lazygit
  ];

  home.file.".config/lazygit/config.yml".source = config.lib.file.mkOutOfStoreSymlink ../../dotfiles/lazygit/config.yml;
}
