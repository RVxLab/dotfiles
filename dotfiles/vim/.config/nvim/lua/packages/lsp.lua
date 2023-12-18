return {
    { 'williamboman/mason.nvim', },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
        },
        config = {
            ensure_installed = {
                'lua_ls',
                'html',
                'tsserver',
                'intelephense', -- PHP
                'rust_analyzer',
                -- 'tailwindcss',
                -- 'cssls',
            },
        },
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
        },
    },
}

