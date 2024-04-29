" lua require("pman")

" nnoremap <Leader>ss :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
" nnoremap <Leader>gs :lua require('telescope.builtin').git_files()<CR>
" nnoremap <Leader>fs :lua require('telescope.builtin').find_files()<CR>
" nnoremap <Leader>ds :lua require('pman.telescope').search_dotfiles()<CR>
" nnoremap <leader>F4> :lua require('telescope.builtin').help_tags()<CR>

" nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
" nnoremap <leader>gc :lua require('theprimeagen.telescope').git_branches()<CR>
" nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
" nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
