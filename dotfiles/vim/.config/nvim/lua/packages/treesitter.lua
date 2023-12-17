return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function ()
            local configs = require('nvim-treesitter.configs')
    
            configs.setup({
                ensure_installed = { 'css', 'html', 'lua', 'vim', 'javascript', 'typescript', 'tsx', 'json', 'bash', 'rust', 'php' },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    }
}
