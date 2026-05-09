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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "rust" },
  callback = function()
    local lcs = vim.opt_local.listchars:get()
    lcs.tab = "┊ "
    vim.opt_local.listchars = lcs
  end,
})

local symbol_ref_hl_group = vim.api.nvim_create_augroup("symbol_reference_hl", { clear = true })
local function set_symbol_reference_hl()
  vim.api.nvim_set_hl(0, "CocHighlightText", { bg = "#3d5f25" })
  vim.api.nvim_set_hl(0, "CocHighlightRead", { bg = "#3d5f25" })
  vim.api.nvim_set_hl(0, "CocHighlightWrite", { bg = "#3d5f25" })

  -- Keep native LSP reference groups consistent in case a buffer uses built-in LSP.
  vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#3d5f25" })
  vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#3d5f25" })
  vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#3d5f25" })
end

set_symbol_reference_hl()

vim.api.nvim_create_autocmd("ColorScheme", {
  group = symbol_ref_hl_group,
  callback = set_symbol_reference_hl,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "go",
--   callback = function()
--     vim.opt_local.expandtab = true
--     vim.opt_local.tabstop = 4
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.softtabstop = 4
--   end,
-- })
