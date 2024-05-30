local M = {}

function M.bind(fn, ...)
    local args = { ... }

    return function()
        return fn(table.unpack(args))
    end
end

return M
