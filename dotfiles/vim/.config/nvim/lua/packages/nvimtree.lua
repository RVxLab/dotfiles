local helpers = require('helpers')

return {
    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            view = {
                side = 'right',
            },
        },
        init = function ()
            local map = helpers.make_mapper('<leader>t')
            local api = require('nvim-tree.api')

            map('n', 't', api.tree.open, 'Focus in NvimTree')
        end,
    },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = false,
    }
}
