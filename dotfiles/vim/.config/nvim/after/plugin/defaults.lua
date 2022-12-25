-- Helpers
local function map(modes, shortcut, command, desc, silent, opts)
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

local function nmap(shortcut, command, desc, silent, opts)
    map('n', shortcut, command, desc, silent, opts)
end

local function makeNmapper(prefix)
    return function(shortcut, command, desc, silent, opts)
        nmap(shortcut, command, prefix..': '..desc, silent, opts)
    end
end

-- General vim options
vim.opt.relativenumber = true

-- ALE

local aleLinters = {}
local aleFixers = {}

-- TODO: Add linters and fixers

vim.g.ale_completion_enabled = 0
vim.g.ale_lint_on_save = 1

if #aleLinters > 0 then
    vim.g.ale_linters = aleLinters
end

if #aleFixers > 0 then
    vim.g.ale_fixers = aleFixers
end

-- nvim-tree
local nvt = require('nvim-tree.api')
local nmapVimTree = makeNmapper('Nvim Tree')

nmapVimTree('<leader>tt', nvt.tree.toggle, '[t]oggle [t]tree')
nmapVimTree('<leader>to', nvt.tree.open, '[t]oggle [o]pen')
nmapVimTree('<leader>tc', nvt.tree.close, '[t]oggle [c]lose')

require('nvim-tree').setup({
    view = {
        side = 'right',
    },
})


