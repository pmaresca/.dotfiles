vim.api.nvim_set_keymap('n', '<Leader>h', ":FocusSplitLeft<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>l', ":FocusSplitRight<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>j', ":FocusSplitDown<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ":FocusSplitUp<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>=', ":FocusEqualise<CR>", { silent = true })
