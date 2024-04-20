local wezterm = require("wezterm")
local config = wezterm.config_builder()

-------------------------------------------------------------------------------
-- Fonts
-------------------------------------------------------------------------------
config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 13.0

-- Fix fonts looking really thin
config.freetype_load_flags = "NO_HINTING"

-------------------------------------------------------------------------------
-- Color scheme
-------------------------------------------------------------------------------
config.color_scheme = "Catppuccin Frappe"

return config
