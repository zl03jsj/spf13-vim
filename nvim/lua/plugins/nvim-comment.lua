-- https://github.com/numToStr/Comment.nvim
-- https://github.com/terrortylor/nvim-comment

local M_nerdcommenter = {
    'preservim/nerdcommenter',
    tag = "2.6.0",
    keys = {
        { "<c-/>", ':call nerdcommenter#Comment("n", "toggle")<cr>',    mode = 'n', { expr = false, silent = true } },
        { "<c-/>", ':call nerdcommenter#Comment("n", "toggle")<cr>',    mode = 'x', { expr = false, silent = true } },
        { "cc",    ':call nerdcommenter#Comment("n", "comment")<cr>',   mode = 'n', { expr = false, silent = true } },
        { "cc",    ':call nerdcommenter#Comment("n", "comment")<cr>',   mode = 'x', { expr = false, silent = true } },
        { "cu",    ':call nerdcommenter#Comment("n", "uncomment")<cr>', mode = 'n', { expr = false, silent = true } },
        { "cu",    ':call nerdcommenter#Comment("n", "uncomment")<cr>', mode = 'x', { expr = false, silent = true } },
    },
    lazy = false,
    config = function()
        -- Create default mappings
        vim.g.NERDCreateDefaultMappings = 0
        -- Add spaces after comment delimiters by default
        vim.g.NERDSpaceDelims = 1
        -- Use compact syntax for prettified multi-line comments
        vim.g.NERDCompactSexyComs = 1
        -- Align line-wise comment delimiters flush left instead of following code indentation
        vim.g.NERDDefaultAlign = 'left'
        -- Set a language to use its alternate delimiters by default
        vim.g.NERDAltDelims_java = 1
        -- Add your own custom formats or override the defaults
        vim.g.NERDCustomDelimiters = { c = { left = '/**', right = '*/' } }
        -- Allow commenting and inverting empty lines (useful when commenting a region)
        vim.g.NERDCommentEmptyLines = 1
        -- Enable trimming of trailing whitespace when uncommenting
        vim.g.NERDTrimTrailingWhitespace = 1
        -- Enable NERDCommenterToggle to check all selected lines is commented or not
        vim.g.NERDToggleCheckAllLines = 1
    end
}

local M_comment = {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            ignore = '^$',
            toggler = {
                line = '<leader>cc',
                block = '<leader>bc',
            },
        })
    end
}

local M_nvim_comment = {
    'terrortylor/nvim-comment',
    keys = {
        { "<c-/>", mode = 'x', "<cmd>CommentToggle<cr>" },
        { "<c-/>", mode = 'n', "<cmd>CommentToggle<cr>" },
    },
    lazy = false,
    config = function()
        require('nvim_comment').setup(
            {
                -- Linters prefer comment and line to have a space in between markers
                marker_padding = true,
                -- should comment out empty or whitespace only lines
                comment_empty = false,
                -- trim empty comment whitespace
                comment_empty_trim_whitespace = false,
                -- Should key mappings be created
                create_mappings = false,
                -- Normal mode mapping left hand side
                -- line_mapping = "<leader>cc",
                -- Visual/Operator mapping left hand side
                -- operator_mapping = "<leader>cc",
                -- text object mapping, comment chunk,,
                -- comment_chunk_text_object = "ic",
                -- Hook function to call before commenting takes place
                hook = nil
            })
    end
}

return M_nerdcommenter;
