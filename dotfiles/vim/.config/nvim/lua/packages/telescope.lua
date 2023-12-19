return {
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        init = function ()
            local helpers = require('helpers')
            local map = helpers.make_mapper('<leader>f')
            local builtin = require('telescope.builtin')

            map('n', 'f', builtin.find_files, 'Find files')
            map('n', 'a', builtin.find_files, 'Find all')
            map('n', 'b', builtin.buffers, 'Find buffer')
            map('n', 'c', builtin.current_buffer_fuzzy_find, 'Find in current buffer')
            map('n', 'h', builtin.help_tags, 'Find in current buffer')
        end,
    }
}
