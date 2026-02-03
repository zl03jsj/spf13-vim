local M = {
  url = "https://codeberg.org/andyg/leap.nvim",
  dependencies = { 'tpope/vim-repeat' },
  config = function()
    local leap = require('leap')
    
    -- 1. 移除旧的 leap.add_default_mappings()
    
    -- 2. 设置 "Sneak-style" 映射 (s/S)
    -- 这让你使用 s 向前跳转，S 向后跳转
    leap.add_repeat_matches_by_direction = true
    vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward-to)', { desc = 'Leap forward to' })
    vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward-to)', { desc = 'Leap backward to' })
    -- 3. 设置 "Exclusive" 映射 (用于操作符模式，如 x/X)
    -- 这模仿了 Sneak 的 x/X 行为，在执行删除/修改操作时非常有用
    vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)', { desc = 'Leap from window' })
    vim.keymap.set('n', 's', '<Plug>(leap-anywhere)')
  end
}
return M
