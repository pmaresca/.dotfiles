require("pman.plugins")
require("pman.mason")
require("pman.sets")
require("pman.lualine")
-- enable this when we can figure out nvim native status stuff
-- require("pman.statusline")
require("pman.gitsigns")
require("pman.zenmode")
require("pman.focus")
require("pman.completion")

local augroup = vim.api.nvim_create_augroup
Pman = augroup("pman", {})
local autocmd = vim.api.nvim_create_autocmd
yank_group = augroup('HighlightYank', {})

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

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
    group = Pman,
    pattern = "*.rs",
    callback = function()
        require("lsp_extensions").inlay_hints{}
    end
})

autocmd({"BufWritePre"}, {
    group = Pman,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})


autocmd({"BufWritePost"}, {
  callback = function()
    require("lint").try_lint()
  end,
})
