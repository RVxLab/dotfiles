-- Define the Hyper key
local hyper = hs.hotkey.modal.new({}, "F17")
local hyper_mod = { "ctrl", "shift", "alt", "cmd" }

local function bind_hyper(key, fn)
    key = tostring(key)

    hs.console.printStyledtext("Binding Hyper + " .. key)

    hyper:bind({}, key, function()
        local result = fn()

        if result ~= false then
            hyper.triggered = true
        end
    end)
end

local function on_hyper_pressed()
    hyper.triggered = false
    hyper:enter()
end

local function on_hyper_released()
    hyper:exit()

    if hyper.triggered == false then
        hs.eventtap.keyStroke({}, "escape")
    end
end

hs.hotkey.bind({}, "f18", on_hyper_pressed, on_hyper_released)

-- Set up the actual bindings
local function bind_spaces(screen)
    local spaces = hs.spaces.spacesForScreen(screen)

    for i, _ in pairs(spaces) do
        bind_hyper(i, function()
            hs.eventtap.keyStroke(hyper_mod, tostring(i))
        end)
    end
end

bind_spaces(hs.screen.primaryScreen())
