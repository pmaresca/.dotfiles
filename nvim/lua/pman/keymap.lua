-- Idk why this stuff doesn't work TJ...I will wait for 0.7
local M = {}
M.nmap = function(tbl)
  vim.keymap.set("n", tbl[1], tbl[2], tbl[3])
end

M.imap = function(tbl)
  vim.keymap.set("n", tbl[1], tbl[2], tbl[3])
end

M.xmap = function(tbl)
  vim.keymap.set("n", tbl[1], tbl[2], tbl[3])
end
-- Shouldn't really use this
M.vmap = function(tbl)
  vim.keymap.set("n", tbl[1], tbl[2], tbl[3])
end

M.buf_nnoremap = function(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0
  opts[3].noremap = 1

  print(opts)
  if opts == nil then
    return
  end
  print(opts[1], opts[2])
  M.nmap(opts)
end

M.buf_inoremap = function(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0
  opts[3].noremap = 1

  M.imap(opts)
end

M.buf_xnoremap = function(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0
  opts[3].noremap = 1

  M.xmap(opts)
end

return M
