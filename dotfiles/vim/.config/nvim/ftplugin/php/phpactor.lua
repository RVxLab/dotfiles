local helpers = require('rvxlab.helpers')

local nmap = helpers.makeNmapper('Phpactor')

local defaultPrefix = '<leader>C'

local function prefixed(cmd, prefix)
    prefix = prefix or defaultPrefix

    return prefix .. cmd
end

local cmd = vim.cmd

nmap(prefixed('ic'), cmd.PhpactorImportClass, '[i]mport [c]lass')

