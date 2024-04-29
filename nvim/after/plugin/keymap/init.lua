local Remap = require("pman.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("<Leader><CR>", ":source /Users/peter_maresca/.config/nvim/init.lua<CR>", { silent = true })
-- greatest remap ever
xnoremap("<leader>p", "\"_dP")
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Go to a file in Github
nnoremap("<leader>gh", ":OpenInGHFile develop<CR>")
nnoremap("<leader>gH", ":OpenInGHRepo<CR>")
