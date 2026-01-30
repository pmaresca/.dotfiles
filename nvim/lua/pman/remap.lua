vim.g.mapleader = " "
-- Move Selected Text smoothly between lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>ff", vim.cmd.Ex)

-- vim.keymap.set("n", "J", "mzJ`z")
-- Nice Screen scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- vim.keymap.set("n", "=ap", "ma=ap'a")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- GH Plugin Keymaps
vim.keymap.set("n", "<leader>gh", ":OpenInGHFile develop<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gH", ":OpenInGHRepo<CR>")
-- Focus
vim.keymap.set("n", "<Leader>h", ":FocusSplitLeft<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Leader>l", ":FocusSplitRight<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Leader>j", ":FocusSplitDown<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Leader>k", ":FocusSplitUp<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Leader>=", ":FocusEqualise<CR>", { silent = true, noremap = true })
-- Telescope
vim.keymap.set("n", "<Leader>ss", function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")}) end, { desc = "Grep String", silent = true, noremap = true })
vim.keymap.set("n","<Leader>rs", function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep Regex For > "), use_regex = true}) end, { desc = "Grep Regex", silent = true, noremap = true })
vim.keymap.set("n","<Leader>gs", function() require('telescope.builtin').git_files() end, { desc = "Git files", silent = true, noremap = true })
vim.keymap.set("n","<Leader>fs", function() require('telescope.builtin').find_files() end, { desc = "Find files", silent = true, noremap = true })
-- nnoremap("<Leader>ds", function() require('pman.telescope').search_dotfiles() end, silent)
-- nnoremap("<leader>F4>", function() require('telescope.builtin').help_tags() end, silent)
vim.keymap.set("n", "<leader>pb", function() require('telescope.builtin').buffers() end, { silent = true, noremap = true })
-- required
-- required
-- These functions are stored in harpoon.
vim.keymap.set("n", "<Leader>HPM", function() require("harpoon"):list():add() end, { silent = true, noremap = true })
vim.keymap.set("n", "<Leader>HPE", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { silent = true, noremap = true })

vim.keymap.set("n", "<Leader>HPG1", function() require("harpoon"):list():select(1) end, { silent = true, noremap = true })
vim.keymap.set("n", "<Leader>HPG2", function() require("harpoon"):list():select(2) end, { silent = true, noremap = true })
vim.keymap.set("n", "<Leader>HPG3", function() require("harpoon"):list():select(3) end, { silent = true, noremap = true })
vim.keymap.set("n", "<Leader>HPG4", function() require("harpoon"):list():select(4) end, { silent = true, noremap = true })
vim.keymap.set("n", "<Leader>HPG5", function() require("harpoon"):list():select(5) end, { silent = true, noremap = true })
vim.keymap.set("n", "<Leader>HPG6", function() require("harpoon"):list():select(6) end, { silent = true, noremap = true })
-- DAP keys see dap.lua
