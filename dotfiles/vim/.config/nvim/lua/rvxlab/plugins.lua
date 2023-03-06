return {
    {
        "Th3Whit3Wolf/one-nvim",
        lazy = false,
        priority = 9001,
        config = function ()
            vim.cmd [[colorscheme one-nvim]]
            vim.o.background = "light"

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
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind-nvim',
        },
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

    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'phpactor/phpactor',
        ft = 'php',
        build = 'composer install --no-dev -o',
    },
}

