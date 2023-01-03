local aleLinters = {
    ['typescript'] = {
        'eslint'
    },
    [ 'typescriptreact' ] = {
        'eslint',
    },
    [ 'php' ] = {
        'phpstan',
    },
}
local aleFixers = {
    ['typescript'] = {
        'prettier'
    },
    [ 'typescriptreact' ] = {
        'prettier',
    },
    [ 'php' ] = {
        'pint',
    },
}

vim.g.ale_completion_enabled = 0
vim.g.ale_lint_on_save = 1
vim.g.ale_fix_on_save = 1

vim.g.ale_linters = aleLinters
vim.g.ale_fixers = aleFixers

