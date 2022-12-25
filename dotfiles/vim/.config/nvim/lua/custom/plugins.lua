return function (use)
    use 'nvim-tree/nvim-web-devicons'
    use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

    use 'tpope/vim-surround'

    use 'gpanders/editorconfig.nvim'

    use 'dense-analysis/ale'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        },
        tag = 'nightly',
    }

    use 'easymotion/vim-easymotion'
end

