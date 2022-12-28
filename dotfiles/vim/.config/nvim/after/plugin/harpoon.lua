local ui = require('harpoon.ui')
local mark = require('harpoon.mark')
local helpers = require('rvxlab.helpers')

local nmap = helpers.makeNmapper('[h]arpoon')

nmap('<leader>ha', mark.add_file, '[a]dd file')
nmap('<leader>hu', ui.toggle_quick_menu, 'Toggle [u]i')
nmap('<leader>hn', ui.nav_next, 'Go to [n]ext')
nmap('<leader>hp', ui.nav_prev, 'Go to [p]revious')

for i = 1, 5 do
    nmap('<leader>h'..i, function () ui.nav_file(i) end, 'Go to file ['..i..']')
end

require('telescope').load_extension('harpoon')

