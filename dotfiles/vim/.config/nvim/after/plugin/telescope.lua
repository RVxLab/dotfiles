local helpers = require('rvxlab.helpers')
local nmap = helpers.makeNmapper('Telescope')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

local telescopeBuiltin = require('telescope.builtin')

-- See `:help telescope.builtin`
nmap('<leader>?', telescopeBuiltin.oldfiles, '[?] Find recently opened files')
nmap('<leader>b', telescopeBuiltin.buffers, '[ ] Find existing buffers')
nmap('<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  telescopeBuiltin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, '[/] Fuzzily search in current buffer]')

nmap('<leader>sf', telescopeBuiltin.find_files, '[S]earch [F]iles')
nmap('<leader>sh', telescopeBuiltin.help_tags, '[S]earch [H]elp')
nmap('<leader>sw', telescopeBuiltin.grep_string, '[S]earch current [W]ord')
nmap('<leader>sg', telescopeBuiltin.live_grep, '[S]earch by [G]rep')
nmap('<leader>sd', telescopeBuiltin.diagnostics, '[S]earch [D]iagnostics')

