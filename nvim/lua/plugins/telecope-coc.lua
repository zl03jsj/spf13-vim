-- https://github.com/nvim-telescope/telescope.nvim

local M = {
    'fannheyward/telescope-coc.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- keys = {
    -- { "<leader>ts", "<cmd>Telescope coc workspace_symbols<cr>" },
    -- { "<leader>r",  "<cmd>Telescope coc references<cr>" },
    -- { "<leader>tc", "<cmd>Telescope coc commands<cr>" },
    -- { "<leader>ti", "<cmd>Telescope coc implementations<cr>" },
    -- { "<leader>tf", "<cmd>Telescope live_grep<cr>" },
    -- { "<leader>ff", "<cmd>Telescope find_files<cr>" },
    -- },
    lazy = false,
    config = function()
        require("telescope").setup({
            extensions = {
                coc = {
                    -- prefer_locations = true,
                    -- layout_strategy = 'horizontal',
                    -- layout_config = {
                    --     width = 0.5,
                    --     preview_width = 0.65,
                    -- },
                    -- winblend = 20,
                }
            },
            -- defaults = {
            --     layout_config = {
            --         width = 0.7,
            --         preview_width = 0.65,
            --     },
            --     layout_strategy = 'horizontal',
            --     winblend = 20,
            --     -- other defaults configuration here
            -- },
            -- other configuration values here
        })
        require('telescope').load_extension('coc')

        local builtin = require('telescope.builtin')
        -- nnoremap <leader>to :lua require('telescope').extensions.coc.document_symbols({winblend=15,layout_strategy='vertical',layout_config={preview_height=0.8,width=0.75}})<cr>
        -- nnoremap <leader>tl :lua require('telescope').extensions.coc.locations({winblend=15,layout_strategy='vertical',layout_config={preview_height=0.6,height=0.6,width=0.75}})<cr>
        -- hi TelescopeResultsBorder guifg=#0e1013 guibg=#0e1013
        -- hi TelescopePreviewBorder guifg=#0e1013 guibg=#0e1013
        vim.api.nvim_command([[
            nnoremap <leader>ts :lua require('telescope').extensions.coc.workspace_symbols({winblend=25,layout_config={preview_width=0.6,width=0.75,height=0.7}})<cr>
            nnoremap <leader>to :lua require('telescope').extensions.coc.document_symbols({winblend=15,layout_config={preview_width=0.6,width=0.75}})<cr>
            nnoremap <leader>tr :lua require('telescope').extensions.coc.references({winblend=15,layout_strategy='vertical',layout_config={preview_height=0.6,height=0.6,width=0.75}})<cr>
            nnoremap <leader>tc :lua require('telescope').extensions.coc.commands({winblend=15,layout_config={width=0.6,width=0.75}})<cr>
            nnoremap <leader>ti :lua require('telescope').extensions.coc.implementations({winblend=15,layout_strategy='vertical',layout_config={preview_height=0.6,height=0.6,width=0.75}})<cr>
            nnoremap <leader>td :lua require('telescope').extensions.coc.workspace_diagnostics({winblend=15,layout_strategy='vertical',layout_config={height=0.75, preview_height=0.7, width=0.75}})<cr>
            nnoremap <leader>th :lua require('telescope.builtin').help_tags({winblend=15,layout_config={preview_width=0.6}})<cr>
            nnoremap <leader>tf :lua require('telescope.builtin').find_files({winblend=20,layout_config={preview_width=0.6, width=0.75}})<cr>
            nnoremap <leader>tb :lua require('telescope.builtin').buffers({winblend=15,layout_config={preview_width=0.6, width=0.75}})<cr>
            nnoremap <leader>tg :lua require('telescope.builtin').live_grep({winblend=15,layout_config={preview_width=0.6, width=0.75}})<cr>
        ]])
        vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
        -- : lua require'telescope.builtin'.find_files({ winblend = 10, preview_width=0.6 })<cr>
        -- : lua require("telescope").extensions.coc.workspace_diagnostics(require('telescope.themes').get_ivy({layout_config={height=0.2}, previewer=false}))
        -- vim.keymap.set('n', '<leader>tf', builtin.find_files, {winblend = 10, preview_width=0.6})
        -- vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
        -- vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
        -- vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
        -- vim.keymap.set('n', '<leader>ta', builtin.help_tags, {})
        -- vim.keymap.set('n', '<leader>ts', builtin.help_tags, {})
        -- vim.keymap.set('n', '<leader>tc', builtin.help_tags, {})
        -- vim.keymap.set('n', '<leader>ti', builtin.help_tags, {})
    end
}

return M
