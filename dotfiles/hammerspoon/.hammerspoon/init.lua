-- jq
local jq = require 'jq'

-- Yabai
local yabai = require "yabai"
yabai.init()

-- General binds
hs.hotkey.bindSpec({ { "ctrl", "cmd", "alt" }, "r" }, function ()
    hs.reload()
    hs.notify.show("Config reloaded!", "The config has been reloaded!", "")
end)

-- Enable Stackline
local stackline = require "stackline"

print("================================" .. jq.jqBin)

stackline:init()
stackline.config:set("appearance.showIcons", false)
stackline.config:set("paths.yabai", yabai.yabaiBin)

-- Enable HS IPC
local brew = require "brew"
hs.ipc.cliInstall(brew.brewBase)

