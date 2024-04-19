{ ... }:
{
  # Don't install Firefox on MacOS, as it's been broken for a long time
  # Homebrew manages it instead
  programs.firefox.package = null;
}
