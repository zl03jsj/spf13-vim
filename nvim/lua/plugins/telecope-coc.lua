-- https://github.com/nvim-telescope/telescope.nvim

local M = {
  "fannheyward/telescope-coc.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      lazy = false,
      dependencies = {
        { "nvim-lua/plenary.nvim" },
      },
      build = [[
            if [ ! "$(command -v rg)" ]; then
                brew install rg
                fi
                ]],
    },
  },
  lazy = false,
  config = function()
    local telescope = require("telescope")
    local make_entry = require("telescope.make_entry")
    local entry_display = require("telescope.pickers.entry_display")

    local function fit_text_head(text, width)
      if vim.fn.strdisplaywidth(text) <= width then
        return text
      end
      if width <= 3 then
        return vim.fn.strcharpart(text, 0, width)
      end

      local keep = width - 3
      local out = ""
      local i = 0
      local total = vim.fn.strchars(text)
      while i < total do
        local ch = vim.fn.strcharpart(text, i, 1)
        if vim.fn.strdisplaywidth(out .. ch) > keep then
          break
        end
        out = out .. ch
        i = i + 1
      end
      return out .. "..."
    end

    local function fit_text_tail(text, width)
      if vim.fn.strdisplaywidth(text) <= width then
        return text
      end
      if width <= 3 then
        return vim.fn.strcharpart(text, 0, width)
      end

      local keep = width - 3
      local out = ""
      local i = vim.fn.strchars(text) - 1
      while i >= 0 do
        local ch = vim.fn.strcharpart(text, i, 1)
        if vim.fn.strdisplaywidth(ch .. out) > keep then
          break
        end
        out = ch .. out
        i = i - 1
      end
      return "..." .. out
    end

    local function shorten_path_col(filename, width)
      local rel = vim.fn.fnamemodify(filename, ":~:.")
      if vim.fn.strdisplaywidth(rel) <= width then
        return rel
      end

      local parts = vim.split(rel, "/", { plain = true, trimempty = true })
      if #parts <= 1 then
        return fit_text_tail(rel, width)
      end

      for i = 1, #parts - 1 do
        if #parts[i] > 0 then
          parts[i] = parts[i]:sub(1, 1)
        end
      end

      local compact = table.concat(parts, "/")
      if vim.fn.strdisplaywidth(compact) <= width then
        return compact
      end
      return fit_text_tail(compact, width)
    end

    local function build_pkg_and_symbol(filename, symbol_name)
      local rel = vim.fn.fnamemodify(filename, ":~:.")
      local dir = vim.fn.fnamemodify(rel, ":h")
      if dir == "." then
        return symbol_name
      end
      local pkg = dir:gsub("/", ".")
      return pkg .. "." .. symbol_name
    end

    local function shorten_pkg_symbol_col(filename, symbol_name, width)
      local rel = vim.fn.fnamemodify(filename, ":~:.")
      local dir = vim.fn.fnamemodify(rel, ":h")
      if dir == "." then
        return fit_text_head(symbol_name, width)
      end

      local pkg = dir:gsub("/", ".")
      local full = pkg .. "." .. symbol_name
      if vim.fn.strdisplaywidth(full) <= width then
        return full
      end

      local pkg_parts = vim.split(pkg, ".", { plain = true, trimempty = true })
      for i = 1, #pkg_parts do
        if #pkg_parts[i] > 2 then
          pkg_parts[i] = pkg_parts[i]:sub(1, 2)
        end
      end

      local compact = table.concat(pkg_parts, ".") .. "." .. symbol_name
      if vim.fn.strdisplaywidth(compact) <= width then
        return compact
      end

      return fit_text_tail(compact, width)
    end

    local workspace_symbols_displayer = entry_display.create({
      separator = " ",
      items = {
        { width = 24 },
        { width = 40 },
        { width = 15 },
      },
    })

    local function workspace_symbols_entry_maker(entry)
      local symbol_type, symbol_name = (entry.text or ""):match("%[(.+)%]%s+(.*)")
      symbol_type = symbol_type or "Unknown"
      symbol_name = symbol_name or entry.text or ""

      local path_col = shorten_path_col(entry.filename or "", 24)
      local pkg_symbol_col = shorten_pkg_symbol_col(entry.filename or "", symbol_name, 40)
      local kind_col = symbol_type:lower()

      local function display()
        return workspace_symbols_displayer({
          path_col,
          pkg_symbol_col,
          kind_col,
        })
      end

      return make_entry.set_default_entry_mt({
        value = entry,
        ordinal = table.concat({
          entry.filename or "",
          build_pkg_and_symbol(entry.filename or "", symbol_name),
          symbol_name,
          symbol_type,
        }, " "),
        display = display,

        filename = entry.filename,
        lnum = entry.lnum,
        col = entry.col,
        text = entry.text,
        symbol_name = symbol_name,
        symbol_type = symbol_type,
      }, {})
    end

    local function open_workspace_symbols(custom_layout)
      require("telescope").extensions.coc.workspace_symbols({
        winblend = 25,
        layout_config = custom_layout,
        entry_maker = workspace_symbols_entry_maker,
      })
    end

    telescope.setup({
      extensions = {
        coc = {
          prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
          push_cursor_on_edit = true, -- save the cursor position to jump back in the future
        },
      },
    })
    telescope.load_extension("coc")
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ss", function()
      open_workspace_symbols({ preview_width = 0.6, width = 0.75, height = 0.7 })
    end, { silent = true })
    vim.keymap.set("n", "<leader>s", function()
      open_workspace_symbols({ preview_width = 0.6, width = 0.75, height = 0.7 })
    end, { silent = true })
    vim.keymap.set("n", "<leader>ts", function()
      open_workspace_symbols({ preview_width = 0.7, width = 0.85, height = 0.85 })
    end, { silent = true })

    -- nnoremap <leader>to :lua require('telescope').extensions.coc.document_symbols({winblend=15,layout_config={preview_width=0.6,width=0.75}})<cr>
    vim.api.nvim_command([[
            nnoremap <leader>to :lua require('telescope').extensions.coc.document_symbols({winblend=15,layout_strategy='vertical',layout_config={preview_height=0.7,height=0.85,width=0.75}})<cr>
            nnoremap <leader>tr :lua require('telescope').extensions.coc.references({winblend=15,layout_strategy='vertical',layout_config={preview_height=0.7,height=0.8,width=0.8}})<cr>
            nnoremap <leader>r :lua require('telescope').extensions.coc.references({winblend=10,layout_strategy='vertical',layout_config={preview_height=0.7,height=0.8,width=0.8}})<cr>
            nnoremap <leader>tc :lua require('telescope').extensions.coc.commands({winblend=15,layout_config={width=0.6,width=0.75}})<cr>
            nnoremap <leader>ti :lua require('telescope').extensions.coc.implementations({winblend=15,layout_strategy='vertical',layout_config={preview_height=0.75,height=0.75,width=0.75}})<cr>
            nnoremap <leader>i :lua require('telescope').extensions.coc.implementations({winblend=15,layout_strategy='vertical',layout_config={preview_height=0.75,height=0.75,width=0.75}})<cr>
            nnoremap <leader>td :lua require('telescope').extensions.coc.workspace_diagnostics({winblend=15,layout_strategy='vertical',layout_config={height=0.85, preview_height=0.75, width=0.75}})<cr>
            nnoremap <leader>th :lua require('telescope.builtin').help_tags({winblend=15,layout_config={preview_width=0.75}})<cr>
            nnoremap <leader>tf :lua require('telescope.builtin').find_files({winblend=20,layout_config={preview_width=0.75, width=0.7}})<cr>
            nnoremap <leader>tb :lua require('telescope.builtin').buffers({winblend=15,layout_config={preview_width=0.75, width=0.85}})<cr>
            nnoremap <leader>tg :lua require('telescope.builtin').live_grep({winblend=15,layout_config={preview_width=0.75, width=0.85}})<cr>
            autocmd User TelescopePreviewerLoaded setlocal number
        ]])
  end,
}

return M
