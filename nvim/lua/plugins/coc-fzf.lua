local M = {
    'antoinemadec/coc-fzf',
    branch = 'master',
    lazy = false,
    dependencies = {
        { 'junegunn/fzf', branch = "master", build = "./install --all" },
        { 'junegunn/fzf.vim', branch = 'master'},
    },
    config = function ()
        vim.fn['coc_fzf#common#add_list_source']('fzf-buffers','display fzf buffers','Buffers')
    end,
    keys = {
        { "<leader>ss", "<cmd>CocFzfList symbols<cr>" },
        { "<leader>o", "<cmd>CocFzfList outline<cr>" },
    },
}

return M
