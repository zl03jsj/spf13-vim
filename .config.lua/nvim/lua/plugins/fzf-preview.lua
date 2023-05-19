-- https://github.com/yuki-yano/fzf-preview.vim#installation
-- https://github.com/yuki-yano/fzf-preview.vim#command
--
-- install the npm package neovim to get the remote plugin working.
-- $ npm install -g neovim
--
-- Select file from directory files (default to current working directory) (Required [ripgrep](https://github.com/BurntSushi/ripgrep))
-- :FzfPreviewDirectoryFilesRpc {path or none}
-- :FzfPreviewDirectoryFiles {path or none}
-- :CocCommand fzf-preview.DirectoryFiles
-- 

local M = {
    'yuki-yano/fzf-preview.vim',
    branch = 'release/rpc',
    dependencies = {
        'junegunn/fzf',
        branch = "master",
        build = "./install --all"
    },
    keys = {
    --     { "<leader>ts", "<cmd>Telescope coc workspace_symbols<cr>" },
    --     { "<leader>tr", "<cmd>Telescope coc references<cr>" },
    }
}

return M
