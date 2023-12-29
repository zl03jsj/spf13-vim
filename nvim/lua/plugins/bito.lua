local M = {
    'zhenyangze/vim-bitoai',
    lazy = false,
    config = function()
        vim.api.nvim_command([[
            vnoremap <leader>be :BitoAiExplain
            nnoremap <leader>bg :BitoAiGenerate
            nnoremap <leader>bc :BitoAiCheck
            let g:bito_buffer_name_prefix = get(g:, 'bito_buffer_name_prefix', 'bito_history_')
        ]])
    end,
}

return M
