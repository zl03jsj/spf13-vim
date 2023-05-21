-- https://github.com/nvim-telescope/telescope.nvim

local M = {
    'fannheyward/telescope-coc.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    keys = {
        { "<leader>ts", "<cmd>Telescope coc workspace_symbols<cr>" },
        { "<leader>tr", "<cmd>Telescope coc references<cr>" },
        { "<leader>tc", "<cmd>Telescope coc commands<cr>" },
        { "<leader>ti", "<cmd>Telescope coc implementations<cr>" },
        -- { "<leader>tf", "<cmd>Telescope live_grep<cr>" },
        -- { "<leader>ff", "<cmd>Telescope find_files<cr>" },
    },
    lazy = false,
    config = function()
        telescope = require("telescope")
        telescope.setup({
            extensions = {
                coc = {
                    theme = 'ivy',
                    prefer_locations = false, -- true: always use Telescope locations to preview definitions/declarations/implementations etc
                }
            },
        })
        telescope.load_extension('coc')
    end
}

return M
