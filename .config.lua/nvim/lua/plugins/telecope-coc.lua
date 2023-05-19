local M = {
    'fannheyward/telescope-coc.nvim',
    -- keys = {
    --     { "<leader>ts", "<cmd>Telescope coc workspace_symbols<cr>" },
    --     { "<leader>tr", "<cmd>Telescope coc references<cr>" },
    -- },
    config = function ()
        require("telescope").setup({
            extensions = {
                coc = {
                    theme = 'ivy',
                    prefer_locations = false, -- true: always use Telescope locations to preview definitions/declarations/implementations etc
                }
            },
        })
        require('telescope').load_extension('coc')
    end
}

return {}
