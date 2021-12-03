require("pman.harpoon")
require("pman.telescope")
require("pman.lsp")
require("pman.lualine")
require("pman.gitsigns")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
