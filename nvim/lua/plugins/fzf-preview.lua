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
    lazy = false,
    keys = {
        -- { "<leader>r", "<cmd>CocCommand fzf-preview.CocReferences<cr>" },
        -- { "<leader>i",  "<cmd>CocCommand fzf-preview.CocImplementations<cr>" },
        -- { "<leader>o",  "<cmd>CocCommand fzf-preview.CocOutline<cr>" },
        { "<leader><leader>d", "<cmd>CocCommand fzf-preview.CocDiagnostics<cr>" },
        { "<leader>g", "<cmd>CocCommand fzf-preview.GitLogs<cr>" },
    }
}

return M
