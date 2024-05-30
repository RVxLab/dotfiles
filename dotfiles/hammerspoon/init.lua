-- Plugins
local reloadConfig = hs.loadSpoon("ReloadConfiguration")
reloadConfig:start()

local hyper = require("./hyper")
local yabai = require("./yabai")
local utils = require("./utils")

-- Space bindings
local function bind_spaces(screen)
    local spaces = hs.spaces.spacesForScreen(screen)

    for i, _ in pairs(spaces) do
        hyper.bind(i, function()
            hs.eventtap.keyStroke(hyper.mod, tostring(i))
        end)
    end
end

bind_spaces(hs.screen.primaryScreen())

hs.screen.watcher.new(function()
    bind_spaces(hs.screen.primaryScreen())
end)

-- Other bindings
local bindings = {
    y = function()
        yabai.restart(function()
            hs.notify.show("Yabai restarted", "Yabai has been restarted", "")
        end)
    end,
    u = yabai.balance,
    up = utils.bind(yabai.mirror, "x"),
    right = utils.bind(yabai.mirror, "y"),
    h = utils.bind(yabai.focus_window, "west"),
    j = utils.bind(yabai.focus_window, "south"),
    k = utils.bind(yabai.focus_window, "north"),
    l = utils.bind(yabai.focus_window, "east"),
}

for key, binding in pairs(bindings) do
    hyper.bind(key, binding)
end
