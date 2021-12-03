local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local signs = { Error = "☹︎", Warning = "!", Hint = "", Information = "?" }
for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	path = "[Path]",
}
local lspkind = require("lspkind")
require('lspkind').init({
    with_text = true,
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

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
	-- 	["<C-u>"] = cmp.mapping.scroll_docs(-4),
	-- 	["<C-d>"] = cmp.mapping.scroll_docs(4),
	-- 	["<C-Space>"] = cmp.mapping.complete(),
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

require("lspconfig").pylsp.setup(config({
	settings = {
            pylsp = {
	        configurationSources = { "flake8", "mypy", "pylint" },
                plugins = {
                    flake8 = { enabled = true },
                    mypy = { enabled = false },
		    pycodestyle =  { enabled = false },
		    pydocstyle = { enabled = false },
		    pyflakes = { enabled=false },
		    mccabe = { enabled=false },
		    pylint = { enabled= true },
                },
            },
        }
}))
require("lspconfig").eslint.setup(config({
	settings = {
		eslint = {
			packageManager = "yarn",
			options = { overrideConfigFile = "~/.config/.eslintrc" }
		}
	}
}))
