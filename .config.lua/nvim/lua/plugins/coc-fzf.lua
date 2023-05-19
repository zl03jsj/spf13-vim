local M = {
    'antoinemadec/coc-fzf',
    branch = 'master',
    dependencies = {
        { 'junegunn/fzf', branch = "master", build = "./install --all" },
        { 'junegunn/fzf.vim', branch = 'master'},
    },
    config = function ()
    end
}

return M
