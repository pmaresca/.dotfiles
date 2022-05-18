local au = require("pman.au")
local M = {}
local function map(mode, shortcut, command, options)
  -- vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
  -- vim.keymap.set(mode, shortcut, command, options)
  vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

local function buf_map(bufnr, mode, shortcut, command, options)
  -- vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
  -- vim.keymap.set(mode, shortcut, command, options)
  vim.api.nvim_buf_set_keymap(bufnr, mode, shortcut, command, options)
end

M.nmap = function (shortcut, command, options)
  map("n", shortcut, command, options)
end

M.buf_nmap = function (bufnr, shortcut, command, options)
  buf_map(bufnr, "n", shortcut, command, options)
end

M.imap = function (shortcut, command, options)
  map("i", shortcut, command, options)
end

-- Shouldn't really use this...
M.vmap = function (shortcut, command, options)
  map("v", shortcut, command, options)
end

M.xmap = function (shortcut, command, options)
  map("x", shortcut, command, options)
end

M.buf_xmap = function (bufnr, shortcut, command, options)
  buf_map(bufnr, "x", shortcut, command, options)
end
-- Cool floating window popup menu for completion on command line
vim.o.pumblend = 17
vim.o.wildoptions = "pum"
-- Nice menu when typing `:find *.py`
vim.o.wildmode = "longest,list,full"
vim.o.wildmenu = true
--  Ignore files
vim.o.wildignore = "**/node_modules/*"
vim.o.wildignore = vim.o.wildignore .. ",*_build/*"
vim.o.wildignore = vim.o.wildignore .. ",**/coverage/*"
vim.o.wildignore = vim.o.wildignore .. ",**/android/*"
vim.o.wildignore = vim.o.wildignore .. ",**/ios/*"
vim.o.wildignore = vim.o.wildignore .. ",**/.git/*"
vim.o.wildignore = vim.o.wildignore .. ",**/undodir/*"
vim.o.wildignore = vim.o.wildignore .. ",*.o"
vim.o.wildignore = vim.o.wildignore .. ",*~"
vim.o.wildignore = vim.o.wildignore .. ",*pycache*"
vim.o.wildignore = vim.o.wildignore .. ",*.pyc"
vim.o.guicursor = ""
vim.o.relativenumber = true
-- Not available in lua yet?
-- vim.o.nohlsearch = true
vim.o.hidden = true
-- Not available in lua yet?
-- vim.o.noerrorbells = true
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.smartindent = true
vim.o.nu = true
-- Not available in lua yet?
-- vim.o.nowrap = true
-- Not available in lua yet?
-- vim.o.noswapfile = true
vim.o.undofile = true
vim.o.undodir = "/Users/peter_maresca/.vim./undodir"
vim.o.incsearch = true
vim.opt.termguicolors = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
-- Not available in lua yet?
-- vim.o.isfname = vim.o.isfname .. "@-@"
vim.o.cmdheight = 2
vim.o.updatetime = 250
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.timeoutlen = 2000
-- Experimental configs?
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.conceallevel = 0
vim.o.backup = false
vim.o.writebackup = false
vim.o.clipboard = "unnamedplus"
-- vim.o.hlsearch = false
vim.o.sidescrolloff = 5
-- vim.wo.wrap = false
-- vim.wo.number = true
vim.o.cursorline = true
vim.o.autoindent = true
vim.bo.autoindent = true
-- Leader and mappings
vim.g.mapleader = " "
M.nmap("<Leader><CR>", ":so /Users/peter_maresca/.config/nvim/init.lua<CR>", { noremap = true, silent = true })
-- interesting idea lets see if g replace sticks
-- nnoremap g. /\V<C-r>"<CR>cgn<C-a><Esc>
-- nmap("g.", '/\V<C-r>"<CR>cgn<C-a><Esc>')
---------------------------GROUP SHIT
au.group("fileconfig", {
    { "BufWritePre", "*", "%s/\\s\\+$//e"}
})
-- augroup filconfig
    -- autocmd!
    -- " Get that trailing shit out of here man
    -- autocmd BufWritePre * %s/\s\+$//e
-- autocmd FileType lua,javascript setlocal shiftwidth=2 tabstop=2 expandtab
    -- autocmd FileType json setlocal shiftwidth=4 softtabstop=4 expandtab
    -- autocmd FileType html setlocal shiftwidth=2 tabstop=2
    -- autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
-- augroup END
return M
