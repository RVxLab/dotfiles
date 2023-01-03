-- Import default NVim settings
require('rvxlab.settings')

-- Import package manager
local packages = require('rvxlab.packages')

packages.init()
packages.setup()

-- Import remaps
require('rvxlab.remap')

-- Import auto commands
require('rvxlab.autocmd')

