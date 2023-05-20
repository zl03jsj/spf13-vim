local M = {
    'fannheyward/telescope-coc.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    keys = {
        { "<leader>ts", "<cmd>Telescope coc workspace_symbols<cr>" },
        { "<leader>tr", "<cmd>Telescope coc references<cr>" },
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
