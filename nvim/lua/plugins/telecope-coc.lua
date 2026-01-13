-- https://github.com/nvim-telescope/telescope.nvim

local M = {
    'fannheyward/telescope-coc.nvim',
    dependencies = {
        {
            'nvim-telescope/telescope.nvim',
            lazy = false,
            dependencies = {
                { 'nvim-lua/plenary.nvim' },
                { "navarasu/onedark.nvim" },
            },
            build = [[
            if [ ! "$(command -v rg)" ]; then
                brew install rg
                fi
                ]],
        }
    },
    lazy = false,
    config = function()
        local telescope = require("telescope")
        telescope.setup({ extensions = { coc = {
            prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
            push_cursor_on_edit = true, -- save the cursor position to jump back in the future
        }, }, })
        telescope.load_extension('coc')
        local builtin = require('telescope.builtin')

        -- nnoremap <leader>to :lua require('telescope').extensions.coc.document_symbols({winblend=15,layout_config={preview_width=0.6,width=0.75}})<cr>
        vim.api.nvim_command([[
            nnoremap <leader>ts :lua require('telescope').extensions.coc.workspace_symbols({winblend=25,layout_config={preview_width=0.7,width=0.85,height=0.85}})<cr>
            nnoremap <leader>s :lua require('telescope').extensions.coc.workspace_symbols({winblend=25,layout_config={preview_width=0.6,width=0.75,height=0.7}})<cr>
            nnoremap <leader>to :lua require('telescope').extensions.coc.document_symbols({winblend=15,layout_strategy='vertical',layout_config={preview_height=0.7,height=0.85,width=0.75}})<cr>
            nnoremap <leader>tr :lua require('telescope').extensions.coc.references({winblend=15,layout_strategy='vertical',layout_config={preview_height=0.7,height=0.8,width=0.8}})<cr>
            nnoremap <leader>r :lua require('telescope').extensions.coc.references({winblend=10,layout_strategy='vertical',layout_config={preview_height=0.7,height=0.8,width=0.8}})<cr>
            nnoremap <leader>tc :lua require('telescope').extensions.coc.commands({winblend=15,layout_config={width=0.6,width=0.75}})<cr>
            nnoremap <leader>ti :lua require('telescope').extensions.coc.implementations({winblend=15,layout_strategy='vertical',layout_config={preview_height=0.75,height=0.75,width=0.75}})<cr>
            nnoremap <leader>i :lua require('telescope').extensions.coc.implementations({winblend=15,layout_strategy='vertical',layout_config={preview_height=0.75,height=0.75,width=0.75}})<cr>
            nnoremap <leader>td :lua require('telescope').extensions.coc.workspace_diagnostics({winblend=15,layout_strategy='vertical',layout_config={height=0.85, preview_height=0.75, width=0.75}})<cr>
            nnoremap <leader>th :lua require('telescope.builtin').help_tags({winblend=15,layout_config={preview_width=0.75}})<cr>
            nnoremap <leader>tf :lua require('telescope.builtin').find_files({winblend=20,layout_config={preview_width=0.75, width=0.7}})<cr>
            nnoremap <leader>tb :lua require('telescope.builtin').buffers({winblend=15,layout_config={preview_width=0.75, width=0.85}})<cr>
            nnoremap <leader>tg :lua require('telescope.builtin').live_grep({winblend=15,layout_config={preview_width=0.75, width=0.85}})<cr>
            autocmd User TelescopePreviewerLoaded setlocal number
        ]])
    end
}

return M;
