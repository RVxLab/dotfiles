local helpers = require('rvxlab.helpers')

local nvt = require('nvim-tree.api')
local nmap = helpers.makeNmapper('Nvim Tree')

nmap('<leader>tt', nvt.tree.toggle, '[t]oggle [t]tree')
nmap('<leader>to', nvt.tree.open, '[t]oggle [o]pen')
nmap('<leader>tc', nvt.tree.close, '[t]oggle [c]lose')
nmap('<leader>tf', nvt.tree.focus, '[t]oggle [f]ocus')
nmap('<leader>tF', function ()
    nvt.tree.toggle(true, nil, vim.fn.expand('%'))
end, '[t]oggle [F]ocus current file')

require('nvim-tree').setup({
    view = {
        side = 'right',
    },
})
