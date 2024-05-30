local M = {}

local hyper = hs.hotkey.modal.new({}, "F17")

M.mod = { "ctrl", "alt", "cmd", "shift" }

function M.bind(key, fn)
    key = tostring(key)

    hs.console.printStyledtext("Binding Hyper + " .. key)

    hyper:bind({}, key, function()
        local result = fn()

        hyper.triggered = result ~= false

        hs.console.printStyledtext("Hyper + " .. key .. " was triggered: " .. tostring(hyper.triggered))
    end)
end

local function on_hyper_enter()
    hyper.triggered = false
    hyper:enter()
end

local function on_hyper_exit()
    hyper:exit()
    if not hyper.triggered then
        hs.eventtap.keyStroke({}, "ESCAPE")
    end
end

hs.hotkey.bind({}, "F18", on_hyper_enter, on_hyper_exit)

return M
