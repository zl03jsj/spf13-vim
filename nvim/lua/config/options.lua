-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","

vim.opt.termguicolors = true
vim.api.nvim_command("filetype plugin indent on")
vim.api.nvim_command("set cursorline")
-- vim.api.nvim_command('set cursorcolumn')
vim.opt.showcmd = true
vim.opt.encoding = "utf-8"
vim.opt.wildmenu = true
vim.opt.pumheight = 10
vim.opt.conceallevel = 0
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.inccommand = ""
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeoutlen = 400
vim.opt.backspace = "indent,eol,start"
vim.opt.whichwrap = "b,s,<,>,h,"
vim.opt.mouse = "a"
vim.opt.vb = true
vim.opt.hidden = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.textwidth = 180
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
vim.opt.smarttab = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo"
vim.opt.viminfo = "!,'10000,<50,s10,h"
vim.opt.viewdir = os.getenv("HOME") .. "/.vim/view"
-- vim.opt.foldtext = 'v:lua.MagicFoldText()'
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
vim.opt.shortmess = "filnxtToOcIF"
vim.opt.scrolloff = 5
vim.opt.showmode = false
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.cul = true
vim.opt.signcolumn = "yes"
-- vim.opt.fillchars = 'fold:-,stlnc:#,eob: ,foldsep:='
vim.opt.wrap = true
vim.opt.autoread = true
vim.opt.visualbell = false
vim.opt.errorbells = false
vim.opt.belloff = "all"

-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = "unnamed,unnamedplus" -- use system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a" -- allow the mouse to be used in Nvim

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

vim.api.nvim_command("filetype plugin indent on")

-- Folding
vim.opt.foldenable = true
vim.opt.foldmethod = "syntax"
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldnestmax = 5
vim.opt.foldcolumn = "1"
vim.wo.foldlevel = 5
vim.opt.foldlevelstart = 99
-- let g:incsearch#auto_nohlsearch = 1
-- Transparency
-- set transparency for coc pop menus.
-- vim.opt.pumblend = 15
-- " autocmd user CocOpenFloat call setwinvar(g:coc_last_float_win, "&winblend", 15)

-- PersistentUndo
vim.api.nvim_command([[
function! InitializeDirectories()
    let dir_list = { 'backup': 'backupdir', 'views': 'viewdir', 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    let common_dir = $HOME . '/.vim/'

    for [dirname, settingname] in items(dir_list)
        let directory = common_dir . dirname . '/'
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()
]])

vim.cmd([[
augroup vimrc-incsearch-highlight
autocmd!
autocmd CmdlineEnter /,\? :set hlsearch
autocmd CmdlineLeave /,\? :set nohlsearch
" autocmd InsertEnter,VimEnter,CursorHold * :let @/=""
augroup END
]])
-- vim.cmd('augroup vimrc-incsearch-highlight')
-- vim.cmd('autocmd!')
-- vim.cmd('autocmd CmdlineEnter /,\? :set hlsearch')
-- vim.cmd('autocmd CmdlineLeave /,\? :set nohlsearch')
-- vim.cmd('augroup END')

-- vim.g.python3_host_prog = os.getenv('PYTHON') -- export PYTHON=$(which python3)
-- vim.cmd("hi! link CocPum Pmenu")
-- vim.cmd("hi! link CocMenuSel PmenuSel")
-- hi Pmenu term=reverse ctermfg=17 ctermbg=168
-- hi PmenuSel term=reverse ctermfg=17 ctermbg=173
-- hi CursorLine ctermbg=236 guibg=#121212
-- hi default link CocFloating NormalFloat
-- hi CursorColumn guibg=#124b7f term=reverse ctermbg=24
