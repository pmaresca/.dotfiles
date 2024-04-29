local nnoremap = require("pman.keymap").nnoremap

local silent = { silent = true }


nnoremap("<Leader>ss", function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")}) end, silent)
nnoremap("<Leader>rs", function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep Regex For > "), use_regex = true}) end, silent)
nnoremap("<Leader>gs", function() require('telescope.builtin').git_files() end, silent)
nnoremap("<Leader>fs", function() require('telescope.builtin').find_files() end, silent)
-- nnoremap("<Leader>ds", function() require('pman.telescope').search_dotfiles() end, silent)
-- nnoremap("<leader>F4>", function() require('telescope.builtin').help_tags() end, silent)

nnoremap("<leader>pb", function() require('telescope.builtin').buffers() end, silent)
-- nnoremap("<leader>gc", function() require('theprimeagen.telescope').git_branches() end, silent)
-- nnoremap("<leader>gw", function() require('telescope').extensions.git_worktree.git_worktrees() end, silent)
-- nnoremap("<leader>gm", function() require('telescope').extensions.git_worktree.create_git_worktree() end, silent)
