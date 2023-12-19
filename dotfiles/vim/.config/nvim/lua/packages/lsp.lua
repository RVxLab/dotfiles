return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function (_, opts)
            require('mason').setup(opts)
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
        },
        opts = {
            ensure_installed = {
                'lua_ls',
                'html',
                'tsserver',
                'intelephense', -- PHP
                'rust_analyzer',
                'tailwindcss',
                'cssls',
            },
        },
        config = function (_, opts)
            local lsp = require('mason-lspconfig')

            lsp.setup(opts)
            lsp.setup_handlers({
                function (server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
        },
    },
}

