lua require("pman")

" These functions are stored in harpoon.  
nnoremap <silent><Leader>HPM :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><Leader>HPE :lua require("harpoon.ui").toggle_quick_menu()<CR>
" nnoremap <silent><Leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <silent><Leader>HPG1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><Leader>HPG2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><Leader>HPG3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><Leader>HPG4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent><Leader>HPG5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <silent><Leader>HPG6 :lua require("harpoon.ui").nav_file(6)<CR>
