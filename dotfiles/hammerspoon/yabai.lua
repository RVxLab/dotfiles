local M = {}

local yabai_bin = "/opt/homebrew/bin/yabai"

local function run_yabai_command(args, callback)
    local task = hs.task.new(yabai_bin, callback or nil, args)

    task:start()

    return task
end

function M.focus_window(direction)
    run_yabai_command({
        "-m",
        "window",
        "--focus",
        direction,
    })
end

function M.mirror(axis)
    run_yabai_command({
        "-m",
        "space",
        "--mirror",
        string.format("%s-axis", axis),
    })
end

function M.balance()
    run_yabai_command({
        "-m",
        "space",
        "--balance",
    })
end

function M.restart(callback)
    run_yabai_command({
        "--restart-service",
    }, function(code, stdout, stderr)
        if code == 0 then
            callback()
        end
    end)
end

return M
