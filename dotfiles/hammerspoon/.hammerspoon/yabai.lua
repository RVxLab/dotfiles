local brew = require "brew"
local hyper = require "hyper"
local util = require "util"

local Module = {
    yabaiBin = brew.brewBin .. "/yabai"
}

local function defaultOnFailure(stdErr, exitCode, task)
    local title = Module.yabaiBin .. " (" .. task:pid() .. ") failed with exit code " .. exitCode
    hs.notify.show(title, stdErr, "")
end

local function yabai(args, onSuccess, onFailure)
    onSuccess = onSuccess or util.noop
    onFailure = onFailure or defaultOnFailure

    local task = hs.task.new(Module.yabaiBin, function (exitCode, stdOut, stdErr)
        if exitCode == 0 then
            onSuccess(stdOut, task, exitCode)
        else
            onFailure(stdErr, task, exitCode)
        end
    end, util.noop, args)

    if task:start() == false then
        hs.notify.show("Command failed", Module.yabaiBin .. " failed to start correctly, see Hammerspoon console", "")

        return nil
    end

    return task
end

local function stackWithPrev()
    yabai({ "-m", "window", "--stack", "prev" })
end

local function stackWithNext()
    yabai({ "-m", "window", "--stack", "next" })
end

local function mkFocus(which)
    return function ()
        yabai({ "-m", "window", "--focus", which})
    end
end

local function mkMove(whereTo)
    return function ()
        yabai({ "-m", "window", "--swap", whereTo })
    end
end

local function rotate()
    yabai({ "-m", "space", "--rotate", "90" })
end

function Module.init()
    hyper.bind("[", stackWithPrev)
    hyper.bind("]", stackWithNext)

    hyper.bind(";", mkFocus("stack.prev"))
    hyper.bind("'", mkFocus("stack.next"))

    hyper.bind("w", mkMove("north"))
    hyper.bind("a", mkMove("west"))
    hyper.bind("s", mkMove("south"))
    hyper.bind("d", mkMove("east"))

    hyper.bind("h", mkFocus("west"))
    hyper.bind("j", mkFocus("south"))
    hyper.bind("k", mkFocus("north"))
    hyper.bind("l", mkFocus("east"))

    hyper.bind("r", rotate)
end

return Module

