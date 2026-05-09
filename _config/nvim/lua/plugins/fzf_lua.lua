local M = {
    'ibhagwan/fzf-lua',
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' },
        { 'junegunn/fzf',               branch = "master", build = "./install --all" }
    }
}

-- https://github.com/ibhagwan/fzf-lua/issues/775
M.config = function()
    require('fzf-lua').setup {
        keymap = {
            builtin = {
                ["?"]     = "toggle-help",
                ["<esc>"] = "abort",
                ["<c-d>"] = "preview-page-down",
                ["<c-u>"] = "preview-page-up",
            },
        },
        winopts = {
            height = 0.75,
            width = 0.75,
            preview = {
                vertical   = 'down:45%',
                horizontal = 'right:75%',
            },
        },
    }
    opts = { silent = false, nowait = true, }
    vim.keymap.set("n", "<leader>sf",
        ":lua require('fzf-lua').files({winopts={preview={layout='vertical',vertical='up:80%'}}})<cr>", opts)
    vim.keymap.set("n", "<leader>sb",
        ":lua require('fzf-lua').buffers({winopts={preview={layout='vertical',vertical='up:80%'}}})<cr>", opts)
    vim.keymap.set("n", "<leader>sa", ":lua require('fzf-lua').live_grep()<cr>", opts)
    vim.keymap.set("n", "<leader>sw", ":lua require('fzf-lua').grep_cword()<cr>", opts)
    vim.keymap.set("n", "<leader>sg", ":lua require('fzf-lua').grep()<cr>", opts)
    vim.keymap.set("n", "<leader>sc", ":lua require('fzf-lua').colorschemes()<cr>", opts)
    vim.keymap.set("n", "<leader>gc", ":lua require('fzf-lua').git_commits()<cr>", opts)
    vim.keymap.set("n", "<leader>gb", ":lua require('fzf-lua').git_branches()<cr>", opts)
    vim.keymap.set("n", "<leader>gs", ":lua require('fzf-lua').git_status()<cr>", opts)
    vim.keymap.set("n", "<leader>gst", ":lua require('fzf-lua').git_stash()<cr>", opts)
    vim.keymap.set("n", "<leader>fl", ":FzfLua builtin<cr>", opts)
end

return M;

-- local M = {
--     'junegunn/fzf.vim',
--     branch = "master",
--     dependencies = { 'junegunn/fzf', branch = "master", build = "./install --all" }
-- }
--
-- M.config = function()
--     -- vim.g.fzf_preview_window = {'right,40%,<50(down,50%)', 'ctrl-/'}
--     vim.g.fzf_preview_window = {'right:65%', 'ctrl-/'}
--     vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
--     vim.g.fzf_layout = {
--         window={
--             width=0.9,
--             height=0.8
--         }
--     }
--     vim.api.nvim_command([[
--         func! RipgrepFzf(query, fullscreen)
--           let command_fmt = 'rg --color=always --column --line-number --no-heading --smart-case'
--           let command_fmt .= ' --glob "!vendor" --glob "!node_modules"'
--           let command_fmt .= ' --colors "path:fg:green" --colors "path:style:bold"'
--           let command_fmt .= ' --colors "match:fg:151"'
--           let command_fmt .= ' -- %s || true'
--           let initial_command = printf(command_fmt, shellescape(a:query))
--           let reload_command = printf(command_fmt, '{q}')
--           let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
--           let spec = fzf#vim#with_preview(spec, 'right,40%,<50(down,50%)', 'ctrl-/')
--           call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
--         endf
--
--         com! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
--     ]])
--     vim.api.nvim_command([[
--         func! CHistory()
--           call filter(v:oldfiles, "v:val =~ '^' . $PWD . '.*$'")
--           call fzf#vim#history(fzf#vim#with_preview(), 0)
--         endf
--         com! CHistory call CHistory()
--     ]])
--
--     vim.api.nvim_set_keymap('n', '<leader>sa', ':RG<cr>',       { silent = true, noremap = true })
--     vim.api.nvim_set_keymap('n', '<leader>sf', ':Files<cr>',    { silent = true, noremap = true })
--     vim.api.nvim_set_keymap('n', '<leader>sb', ':Buffers<cr>',  { silent = true, noremap = true })
--     vim.api.nvim_set_keymap('n', '<leader>sh', ':CHistory<cr>', { silent = true, noremap = true })
-- end
--
-- return M
