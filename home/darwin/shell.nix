{...}: {
  programs.zsh = {
    # Fix moving forwards and backwards between words with Opt + Arrow
    initExtra = ''
      bindkey "^[[1;3C" forward-word
      bindkey "^[[1;3D" backward-word
    '';
  };
}
