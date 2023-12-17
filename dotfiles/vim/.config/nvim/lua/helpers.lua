local helpers = {}

function helpers.map(modes, shortcut, command, desc, opts)
    local options = {
        noremap = true,
        silent = true,
        desc = desc,
    }

    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.keymap.set(modes, shortcut, command, options)
end

function helpers.make_mapper(prefix)
    return function(modes, shortcut, command, desc, opts)
        local real_shortcut = prefix..shortcut
        helpers.map(modes, real_shortcut, command, desc, opts)
    end
end

return helpers
