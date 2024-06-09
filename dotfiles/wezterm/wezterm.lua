local wezterm = require("wezterm")
local config = wezterm.config_builder()

-------------------------------------------------------------------------------
-- Fonts
-------------------------------------------------------------------------------
config.font = wezterm.font("JetbrainsMono Nerd Font")
config.font_size = 15.0
config.line_height = 1.4

-------------------------------------------------------------------------------
-- Color scheme
-------------------------------------------------------------------------------
config.color_scheme = "Catppuccin Macchiato"

-------------------------------------------------------------------------------
-- Keymap
-------------------------------------------------------------------------------
config.keys = {
    {
        key = "Enter",
        mods = "CMD",
        ---@diagnostic disable-next-line: unused-local
        action = wezterm.action_callback(function(_window, pane)
            local active_pane_info = nil

            for _, pane_with_info in ipairs(pane:tab():panes_with_info()) do
                if pane_with_info.pane:pane_id() == pane:pane_id() then
                    active_pane_info = pane_with_info
                end
            end

            if active_pane_info == nil then
                return
            end

            local width = active_pane_info.pixel_width
            local height = active_pane_info.pixel_height

            wezterm.log_info({
                width = width,
                height = height,
            })

            local split_direction = height >= width and "Bottom" or "Right"

            pane:split({
                direction = split_direction,
            })
        end),
    },
}

-------------------------------------------------------------------------------
-- Window settings
-------------------------------------------------------------------------------
config.window_padding = {
    top = 0,
    right = 0,
    bottom = 0,
    left = 0,
}

-------------------------------------------------------------------------------
-- Tab bar
-------------------------------------------------------------------------------
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

return config
