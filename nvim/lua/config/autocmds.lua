-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

if vim.g.vscode then
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyLoad",
    once = true,
    callback = function()
      vim.api.nvim_create_user_command("Fmt", function()
        vim.fn.VSCodeNotify("editor.action.formatDocument")
      end, {})
    end,
  })
end

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "go",
--   callback = function()
--     vim.opt_local.expandtab = true
--     vim.opt_local.tabstop = 4
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.softtabstop = 4
--   end,
-- })
