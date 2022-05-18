require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

local buf_nmap = require("pman.sets").buf_nmap
local buf_xmap = require("pman.sets").buf_xmap
local ts_util = require "nvim-lsp-ts-utils"

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local custom_attach = function(client, bufnr)
  -- But why can it be nil?
  if bufnr == nil then
    bufnr = 0
  end
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
  buf_nmap(bufnr, "<leader>vd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
  buf_nmap(bufnr, "<leader>vi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true})
  buf_nmap(bufnr, "<leader>vsh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
  buf_nmap(bufnr, "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true})
  buf_nmap(bufnr, "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
  buf_nmap(bufnr, "<leader>vh", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
  buf_nmap(bufnr, "<leader>P", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true})
  buf_nmap(bufnr, "<leader>p", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", {noremap = true})
  buf_nmap(bufnr, "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
  buf_nmap(bufnr, "<leader>vsd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>", {noremap = true})
  buf_nmap(bufnr, "<leader>vn", ":lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true})
  buf_xmap(bufnr, "<leader>vll", ":call LspLocationList()<CR>", {noremap = true})

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Attach any filetype specific options to the client
  -- filetype_attach[filetype](client)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
updated_capabilities = require("cmp_nvim_lsp").update_capabilities(updated_capabilities)

local signs = { Error = "☹︎", Warning = "!", Hint = "", Information = "?" }
for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end


-- rust lsp
local opts = {
	tools = { -- rust-tools options
		-- Automatically set inlay hints (type hints)
		autoSetHints = true,

		-- Whether to show hover actions inside the hover window
		-- This overrides the default hover handler
		hover_with_actions = true,

		-- how to execute terminal commands
		-- options right now: termopen / quickfix
		executor = require("rust-tools/executors").termopen,

		runnables = {
			-- whether to use telescope for selection menu or not
			use_telescope = true,

			-- rest of the opts are forwarded to telescope
		},

		debuggables = {
			-- whether to use telescope for selection menu or not
			use_telescope = true,

			-- rest of the opts are forwarded to telescope
		},

		-- These apply to the default RustSetInlayHints command
		inlay_hints = {

			-- Only show inlay hints for the current line
			only_current_line = false,

			-- Event which triggers a refersh of the inlay hints.
			-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
			-- not that this may cause  higher CPU usage.
			-- This option is only respected when only_current_line and
			-- autoSetHints both are true.
			only_current_line_autocmd = "CursorHold",

			-- wheter to show parameter hints with the inlay hints or not
			show_parameter_hints = true,

			-- prefix for parameter hints
			parameter_hints_prefix = "<- ",

			-- prefix for all the other hints (type, chaining)
			other_hints_prefix = "=> ",

			-- whether to align to the length of the longest line in the file
			max_len_align = false,

			-- padding from the left if max_len_align is true
			max_len_align_padding = 1,

			-- whether to align to the extreme right or not
			right_align = false,

			-- padding from the right if right_align is true
			right_align_padding = 7,

			-- The color of the hints
			highlight = "Comment",
		},

		hover_actions = {
			-- the border that is used for the hover window
			-- see vim.api.nvim_open_win()
			border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			},

			-- whether the hover action window gets automatically focused
			auto_focus = false,
		},

		-- settings for showing the crate graph based on graphviz and the dot
		-- command
		crate_graph = {
			-- Backend used for displaying the graph
			-- see: https://graphviz.org/docs/outputs/
			-- default: x11
			backend = "x11",
			-- where to store the output, nil for no output stored (relative
			-- path from pwd)
			-- default: nil
			output = nil,
			-- true for all crates.io and external crates, false only the local
			-- crates
			-- default: true
			full = true,
		},
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
	server = {}, -- rust-analyer options

	-- debugging stuff
	dap = {
		adapter = {
			type = "executable",
			command = "lldb-vscode",
			name = "rt_lldb",
		},
	},
}

require("rust-tools").setup(opts)

-- lua lsp
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup(config({
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
-- TODO get rust and lua in here?
local servers = {
  html = true,
  eslint = true,
  pylsp = true,
  tsserver = {
    init_options = ts_util.init_options,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },

    on_attach = function(client)
      custom_attach(client)

      ts_util.setup { auto_inlay_hints = false }
      ts_util.setup_client(client)
    end,
  },
}
local setup_server = function(server, conf)
  if not conf then
    return
  end

  if type(conf) ~= "table" then
    conf = {}
  end

  conf = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = nil,
    },
  }, conf)

  require("lspconfig")[server].setup(conf)
end

for server, conf in pairs(servers) do
  setup_server(server, conf)
end
