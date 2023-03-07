local Module = {}

local HYPER = { "cmd", "alt", "ctrl", "shift" }

function Module.bind(key, fn)
    hs.hotkey.bindSpec({ HYPER, key }, fn)
end

return Module

