local aleShared = require('rvxlab.ftplugin.shared.javascript.ale')

vim.g.ale_fixers = aleShared.fixers()
vim.g.ale_linters = aleShared.linters()

