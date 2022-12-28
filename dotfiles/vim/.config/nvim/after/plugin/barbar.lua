local helpers = require('rvxlab.helpers')
local nmap = helpers.makeNmapper('Barbar')

nmap('<leader>,', vim.cmd.BufferPrevious, 'Go to the previous buffer')
nmap('<leader>.', vim.cmd.BufferNext, 'Go to the next buffer')
nmap('<leader>q', vim.cmd.BufferClose, 'Close the current buffer')

