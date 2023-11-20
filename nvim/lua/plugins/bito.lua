local M = {
    'zhenyangze/vim-bitoai',
    lazy = false,
    config = function()
        vim.api.nvim_command([[
            vnoremap <leader>be :BitoAiExplain
            nnoremap <leader>bg :BitoAiGenerate
        ]])
    end,
}

return M
