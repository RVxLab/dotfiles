-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Allow highlight groups
vim.opt.termguicolors = true

-- Set leader to space
vim.g.mapleader = ' '

-- Set line numbers, relative numbers are selectively enabled, see autocmd.lua
vim.wo.number = true
vim.wo.relativenumber = true

-- Add a scroll offset to make code reading a little easier towards edges of the screen
vim.g.scrolloff = 5

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

