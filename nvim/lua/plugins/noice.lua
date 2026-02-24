return {
  "folke/noice.nvim",
  opts = function(_, opts)
    -- 1. 安全检查：如果 opts.cmdline 不存在，先初始化它为空表
    opts.cmdline = opts.cmdline or {}

    -- 2. 现在可以安全地赋值了
    opts.cmdline.view = "cmdline" -- 将弹出框移回底部命令行

    -- 如果你还想关掉搜索时的进度提示（可选）
    opts.lsp = opts.lsp or {}
    opts.lsp.progress = { enabled = false }

    return opts
  end,
}
