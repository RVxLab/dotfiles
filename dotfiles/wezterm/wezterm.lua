local wezterm = require("wezterm")
local config = wezterm.config_builder()

-------------------------------------------------------------------------------
-- Fonts
-------------------------------------------------------------------------------
config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 13.0
config.line_height = 1.3

-- Fix fonts looking really thin
config.freetype_load_flags = "NO_HINTING"

-------------------------------------------------------------------------------
-- Color scheme
-------------------------------------------------------------------------------
config.color_scheme = "Catppuccin Frappe"

-------------------------------------------------------------------------------
-- Keymap
-------------------------------------------------------------------------------
config.keys = {}

-------------------------------------------------------------------------------
-- Window settings
-------------------------------------------------------------------------------
config.window_padding = {
    top = 0,
    right = 0,
    bottom = 0,
    left = 0,
}

return config
