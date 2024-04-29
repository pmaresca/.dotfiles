local nnoremap = require("pman.keymap").nnoremap
require("colorbuddy").colorscheme("material")
nnoremap("<leader>mm", function() require('material.functions').toggle_style() end, { silent = true })
