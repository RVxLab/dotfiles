{
  # TODO: Enable when Yabai stops causing freezes
  enable = false;
  # Still not sure if I want to disable SIP
  # enableScriptingAdditions = true
  config = {
    # Enable tiling
    layout = "bsp";

    # Paddings
    top_padding = 5;
    right_padding = 5;
    bottom_padding = 5;
    left_padding = 5;

    # Mouse
    focus_follows_mouse = "off";
    mouse_follows_focus = "off";
    mouse_drop_action = "swap";
  };
  extraConfig = let
    rule = "yabai -m rule --add";
    unmanaged = apps: builtins.concatStringsSep "\n" (map (app: ''${rule} app="^${app}$" manage=off'') apps);
  in ''
    ${unmanaged ["System Settings" "Archive Utility" "Raycast"]}
  '';
}
