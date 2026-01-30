require("pman.set")
require("pman.remap")
require("pman.lazy_init")

local augroup = vim.api.nvim_create_augroup
local ThePmanGroup = augroup('PMan', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = ThePmanGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('BufEnter', {
    group = ThePmanGroup,
    callback = function()
        require("material.functions").change_style("oceanic")
        vim.keymap.set("n", "<leader>mm", function() require("material.functions").toggle_style() end, { silent = true })
    end
})


autocmd('LspAttach', {
    group = ThePmanGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
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

