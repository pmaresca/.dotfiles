local ok, lspkind = pcall(require, "lspkind")
if not ok then
  return
end

lspkind.init()
local cmp = require("cmp")
-- require("lspkind").setup({
-- 	-- with_text = true,
-- 	mode = "symbol_text",
-- })
--
cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			-- require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	-- mapping = {
	--   ["<C-u>"] = cmp.mapping.scroll_docs(-4),
	--   ["<C-d>"] = cmp.mapping.scroll_docs(4),
	--   ["<C-Space>"] = cmp.mapping.complete(),
	-- },
	sources = {
		{ name = "nvim_lsp" },

		-- For luasnip user.
		-- { name = "luasnip" },

		-- For ultisnips user.
		-- { name = 'ultisnips' },

		{ name = "buffer" },
	},
})

