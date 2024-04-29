require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

local Remap = require("pman.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap
local ts_util = require "nvim-lsp-ts-utils"

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local custom_attach = function(client)
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
end


local signs = { Error = "☹︎", Warning = "!", Hint = "", Information = "?" }
for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


local function config(_config)
  local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
  updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
  -- updated_capabilities = require("cmp_nvim_lsp").update_capabilities(updated_capabilities)
  updated_capabilities = require("cmp_nvim_lsp").default_capabilities(updated_capabilities)
	return vim.tbl_deep_extend("force", {
		capabilities = updated_capabilities,
    on_attach = function(client, bufnr)
      local opts = {buffer = bufnr, remap = false}
      nnoremap("<Leader>vd", function() vim.lsp.buf.definition() end, opts)
      nnoremap("<Leader>vi", function() vim.lsp.buf.implementation() end, opts)
      nnoremap("<Leader>vsh", function() vim.lsp.buf.signature_help() end, opts)
      nnoremap("<Leader>vrr", function() vim.lsp.buf.references() end, opts)
      nnoremap("<Leader>vrn", function() vim.lsp.buf.rename() end, opts)
      nnoremap("<Leader>vh", function() vim.lsp.buf.hover() end, opts)
      -- idk how to call this
      -- nnoremap("<Leader><m-f>", function() vim.lsp.buf.formatting() end)
      -- nnoremap("<Leader><m-f>", function() vim.lsp.buf.range_formatting() end)
      nnoremap("<Leader>vsd", function() vim.diagnostic.open_float() end, opts)
      nnoremap("<Leader>vn", function() vim.diagnostic.goto_next() end, opts)
      -- xnoremap("<Leader>vll", function() :call lsplocationlist() end)
    end,
	}, _config or {})
end

-- lua lsp
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").eslint.setup(config())
-- require("lspconfig").tsserver.setup(config())
require("lspconfig").html.setup(config())
-- require("lspconfig").yamlls.setup(config())
require("lspconfig").jedi_language_server.setup(config())
require("lspconfig").ansiblels.setup(config())
require("lspconfig").lua_ls.setup(config({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
    },
	},
}))

