local helpers = require('rvxlab.helpers')

-- Remap <Space> to <Nop> so it doesn't influence the leader key
helpers.map({ 'n', 'v' }, '<Space>', '<Nop>', '')

-- Remap for dealing with word wrap
helpers.nmap('k', "v:count == 0 ? 'gk' : 'k'", '', true, { expr = true })
helpers.nmap('j', "v:count == 0 ? 'gj' : 'j'", '', true, { expr = true })

-- Diagnostics
helpers.nmap('[d', vim.diagnostic.goto_prev)
helpers.nmap(']d', vim.diagnostic.goto_next)
helpers.nmap('<leader>e', vim.diagnostic.open_float)
helpers.nmap('<leader>q', vim.diagnostic.setloclist)

-- Vim config
helpers.nmap('\\Cr', function ()
    vim.cmd('source $MYVIMRC')
    vim.cmd('echo "Vim config has been reloaded"')
end, 'Reload the vim config')

