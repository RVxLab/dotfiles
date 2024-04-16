{ vars, ... }:
{
  home-manager.users.${vars.username}.programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    theme = "Catppuccin-Frappe";

    font = {
      size = 13.0;
      name = "Hack Nerd Font Mono";
    };

    settings = {
      editor = vars.nvimPath;

      # Font settings
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      modify_font = "cell_height 130%";

      # Tabs
      tab_bar_min_tabs = "1";
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}";

      # Layout
      enabled_layouts = "grid";
    };

    keybindings = {
      "super+shift+enter" = "new_window";
      "super+enter" = "new_window_with_cwd";
    };
  };
}
