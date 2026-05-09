-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
if vim.g.vscode then
  local keymap = vim.keymap
  keymap.set("n", "<leader>d", '<Cmd>call VSCodeNotify("editor.action.revealDefinition")<CR>')
  keymap.set("n", "<leader>ds", '<Cmd>call VSCodeNotify("editor.action.revealDefinitionAside")<CR>')
  keymap.set("n", "<leader>i", '<Cmd>call VSCodeNotify("editor.action.goToImplementation")<CR>')
  keymap.set("n", "<leader>r", '<Cmd>call VSCodeNotify("editor.action.goToReferences")<CR>')
  keymap.set("n", "<leader>rn", '<Cmd>call VSCodeNotify("editor.action.rename")<CR>')
end

vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-1>", "1gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-2>", "2gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-3>", "3gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-4>", "4gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-5>", "5gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-6>", "6gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-7>", "7gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-8>", "8gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-9>", "9gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-0>", ":tablast<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", "cP", ':let @+ = expand("%:p")<cr>', { noremap = true })
vim.api.nvim_set_keymap("n", "cp", ':let @+ = expand("%")<cr>', { noremap = true })
