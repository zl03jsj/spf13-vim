local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    change_detection = { notify = false, },
    { "gruvbox-community/gruvbox" },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup({})
        end,
    },
    {
        "folke/neoconf.nvim",
        cmd = "Neoconf"
    },
    'folke/tokyonight.nvim',
    -- "folke/neodev.nvim",
    -- auto load files in ./lua/plugins/*.lua , each returns an plugin to loaded by lazy.
    { import = "plugins" },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup({
                'css',
                'javascript',
                html = {
                    mode = 'foreground',
                }
            })
        end
    },
})
