local helpers = require('helpers')

local function on_attach(buffer)
    local map = helpers.make_mapper('<leader>t')
    local api = require('nvim-tree.api')

    api.config.mappings.default_on_attach(buffer)

    map('n', 't', api.tree.open, 'Focus in NvimTree', {
        buffer = buffer,
    })
end

return {
    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('nvim-tree').setup({
                on_attach = on_attach,
                view = {
                    side = 'right',
                },
            })
        end,
    },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = false,
    }
}
