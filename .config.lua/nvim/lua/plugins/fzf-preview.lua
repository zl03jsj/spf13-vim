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
        { "<leader>fr", "<cmd>CocCommand fzf-preview.CocReferences<cr>" },
        { "<leader>fe", "<cmd>CocCommand fzf-preview.CocDiagnostics<cr>" },
        { "<leader>fce", "<cmd>CocCommand fzf-preview.CocCurrentDiagnostics<cr>" },
        { "<leader>fd",  "<cmd>CocCommand fzf-preview.CocTypeDefinition<cr>" },
        { "<leader>fi",  "<cmd>CocCommand fzf-preview.CocImplementations<cr>" },
        { "<leader>fo",  "<cmd>CocCommand fzf-preview.CocOutline<cr>" },
    }
}

return M
