require("mason").setup({
    PATH = "prepend",
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-tool-installer").setup({
  ensure_installed = {
  }
})
require("mason-lspconfig").setup({
  ensure_installed = {
    -- "lua_lsp",
    "rust_analyzer",
    "pyright",
    "eslint",
    -- "tsserver",
    "ansiblels",
    "bashls",
    "html"
  }
})
