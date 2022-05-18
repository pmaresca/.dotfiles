require("pman.plugins")
require("pman.au")
require("pman.sets")
require("pman.nvim-treesitter")
require("pman.lsp")
require("pman.colors")
require("pman.telescope")
require("pman.harpoon")
require("pman.lualine")
-- enable this when we can figure out nvim native status stuff
-- require("pman.statusline")
require("pman.gitsigns")
require("pman.zenmode")
require("pman.focus")
require("pman.completion")

P = function(v)
	print(vim.inspect(v))
	return v
end

if pcall(require, "plenary") then
	RELOAD = require("plenary.reload").reload_module

	R = function(name)
		RELOAD(name)
		return require(name)
	end
end
