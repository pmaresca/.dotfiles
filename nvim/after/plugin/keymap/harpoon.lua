local nnoremap = require("pman.keymap").nnoremap

local silent = { silent = true }
-- required
local harpoon = require("pman.harpoon")
-- required
-- These functions are stored in harpoon.
nnoremap("<Leader>HPM", function() harpoon:list():add() end, silent)
nnoremap("<Leader>HPE", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, silent)

nnoremap("<Leader>HPG1", function() harpoon:list():select(1) end, silent)
nnoremap("<Leader>HPG2", function() harpoon:list():select(2) end, silent)
nnoremap("<Leader>HPG3", function() harpoon:list():select(3) end, silent)
nnoremap("<Leader>HPG4", function() harpoon:list():select(4) end, silent)
nnoremap("<Leader>HPG5", function() harpoon:list():select(5) end, silent)
nnoremap("<Leader>HPG6", function() harpoon:list():select(6) end, silent)
