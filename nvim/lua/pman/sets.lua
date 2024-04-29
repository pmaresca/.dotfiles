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
vim.o.hidden = true
vim.o.errorbells = false
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.smartindent = true
vim.o.nu = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = "/Users/peter_maresca/.vim./undodir"
vim.o.incsearch = true
vim.opt.termguicolors = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.o.cmdheight = 2
vim.o.colorcolumn = "80"
vim.o.updatetime = 200
vim.opt.shortmess:append("c")
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
vim.o.hlsearch = false
vim.o.sidescrolloff = 5
vim.o.wrap = false
-- vim.wo.number = true
vim.o.cursorline = true
vim.o.autoindent = true
vim.bo.autoindent = true
-- Leader and mappings
vim.g.mapleader = " "
-- M.nmap("<Leader><CR>", ":so /Users/peter_maresca/.config/nvim/init.lua<CR>", { noremap = true, silent = true })
-- M.nmap("<Leader>vvv", "<cmd>Ex<CR>", { noremap = true, silent = true })
-- M.nmap("<Leader>", "<cmd>Explore<CR>", { noremap = true, silent = true })
-- interesting idea lets see if g replace sticks
-- nnoremap g. /\V<C-r>"<CR>cgn<C-a><Esc>
-- nmap("g.", '/\V<C-r>"<CR>cgn<C-a><Esc>')
---------------------------GROUP SHIT
-- interesting idea lets see if g replace sticks
-- nnoremap g. /\V<C-r>"<CR>cgn<C-a><Esc>
-- nmap("g.", '/\V<C-r>"<CR>cgn<C-a><Esc>')
-- autocmd FileType lua,javascript setlocal shiftwidth=2 tabstop=2 expandtab
-- autocmd FileType json setlocal shiftwidth=4 softtabstop=4 expandtab
    -- autocmd FileType html setlocal shiftwidth=2 tabstop=2
    -- autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
