-- https://github.com/fannheyward/telescope.vim

local M = {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    build = [[
        if [ ! "$(command -v rg)" ]; then
            brew install rg
        fi
    ]]
}

return M
