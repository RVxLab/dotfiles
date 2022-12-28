local helpers = {}

function helpers.map(modes, shortcut, command, desc, silent, opts)
    if opts == nil then
        opts = {}
    end

    if silent == nil then
        silent = true
    end

    opts['desc'] = desc
    opts['silent'] = silent

    vim.keymap.set(modes, shortcut, command, opts)
end

function helpers.nmap(shortcut, command, desc, silent, opts)
    helpers.map('n', shortcut, command, desc, silent, opts)
end

function helpers.makeNmapper(prefix)
    return function(shortcut, command, desc, silent, opts)
        helpers.nmap(shortcut, command, prefix..': '..desc, silent, opts)
    end
end

return helpers

