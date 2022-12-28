local helpers = require('rvxlab.helpers')

local nvt = require('nvim-tree.api')
local nmapVimTree = helpers.makeNmapper('Nvim Tree')

nmapVimTree('<leader>tt', nvt.tree.toggle, '[t]oggle [t]tree')
nmapVimTree('<leader>to', nvt.tree.open, '[t]oggle [o]pen')
nmapVimTree('<leader>tc', nvt.tree.close, '[t]oggle [c]lose')

require('nvim-tree').setup({
    view = {
        side = 'right',
    },
})
