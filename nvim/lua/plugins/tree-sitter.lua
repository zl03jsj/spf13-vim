-- https://github.com/nvim-treesitter/nvim-treesitter
local G = require('G')
local M = {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    dependencies = {
        { "p00f/nvim-ts-rainbow", branch = 'master' },
    },
}

function M.config()
    local config = require('nvim-treesitter.configs')
    config.setup({
        ensure_installed = { 'typescript', 'bash', 'rust', 'cpp', 'javascript',
            'vue', 'go', 'c', 'vim', 'lua', 'markdown', 'json' },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true
        },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        },
    })
    G.map({
        { 'n', 'H', ':TSToggle highlight<CR>', { silent = true, noremap = true } },
    })
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.wo.foldlevel = 99
end

return M
