M = {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
        mappings = {
            -- Use tab for completion
            complete = {
                insert = '',     -- Explicitly set an empty string. It lets regular copilot plugin overrides CopilotChat.nvim
            }
        }
        -- See Configuration section for options
    },

    config = function()
        require('fzf-lua').register_ui_select()
    end
}

return M;
