return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 9001,
        config = function ()
            vim.cmd [[colorscheme onedark]]
        end
    },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },
    { 'tpope/vim-sleuth' },
    { 'tpope/vim-surround' },

    { 'nvim-tree/nvim-web-devicons' },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        tag = 'nightly',
    },

    {
        'romgrk/barbar.nvim',
        dependencies = { 'nvim-web-devicons' }
    },


    { 'gpanders/editorconfig.nvim' },

    { 'dense-analysis/ale' },

    { 'easymotion/vim-easymotion' },

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'j-hui/fidget.nvim',
            'folke/neodev.nvim',
        },
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
          pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = { 'nvim-treesitter' },
    },

    { 'lewis6991/gitsigns.nvim' },

    { 'nvim-lualine/lualine.nvim' },

    { 'lukas-reineke/indent-blankline.nvim' },

    { 'numToStr/Comment.nvim' },

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = vim.fn.executable 'make' == 1
    },
}
