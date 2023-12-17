-------------------------------------------------------------------------------
-- Set up general vim settings
-------------------------------------------------------------------------------
require('settings')

-------------------------------------------------------------------------------
-- Set up packages
-------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('packages')

-------------------------------------------------------------------------------
-- Set up bindings
-------------------------------------------------------------------------------
require('bindings')

-------------------------------------------------------------------------------
-- Set up auto commands
-------------------------------------------------------------------------------
require('autocmd')
