local execute = vim.api.nvim_command
local fn = vim.fn

local packer_install_dir = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local plug_url_format = "https://github.com/%s"

local packer_repo = string.format(plug_url_format, "wbthomason/packer.nvim")
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

if fn.empty(fn.glob(packer_install_dir)) > 0 then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  execute(install_cmd)
  execute("packadd packer.nvim")
end
vim.cmd([[packadd packer.nvim]])

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  use("tjdevries/colorbuddy.nvim")
  use("tjdevries/gruvbuddy.nvim")
  use("marko-cerovac/material.nvim")
  use("tpope/vim-fugitive")
  use({ "tpope/vim-sensible", branch = "master" })
  use("tpope/vim-commentary")
  use("tpope/vim-surround")
  -- Rust
  use({ "rust-lang/rust.vim", ft = { "rust" } })
  use("simrat39/rust-tools.nvim")
  -- use 'rktjmp/lush.nvim'
  -- Zen Mode
  use("folke/zen-mode.nvim")
  -- Git gutter
  use("lewis6991/gitsigns.nvim")
  use("nvim-lualine/lualine.nvim")
  use("kyazdani42/nvim-web-devicons")
  -- Focus
  use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end }
  -- Harpoon
  use({ "ThePrimeagen/harpoon", requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" } })
  -- LSP Stuff
  use("neovim/nvim-lspconfig")
  use("jose-elias-alvarez/nvim-lsp-ts-utils")
  -- Telescopic Stuff
  use("onsails/lspkind-nvim")
  use({
    "hrsh7th/nvim-cmp",
  })
  use({"hrsh7th/cmp-nvim-lsp", requires= {"hrsh7th/nvim-cmp"}})
  use({"hrsh7th/cmp-nvim-lsp-document-symbol", event = "InsertEnter", requires= {"hrsh7th/nvim-cmp"}})
  use({"hrsh7th/cmp-nvim-lua", requires= {"hrsh7th/nvim-cmp"}})
  use({"hrsh7th/cmp-path", requires= {"hrsh7th/nvim-cmp"}})
  use({"hrsh7th/cmp-buffer", requires= {"hrsh7th/nvim-cmp"}})

  use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" } })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  -- Nice formatting
  use("windwp/nvim-autopairs")
  use("lukas-reineke/indent-blankline.nvim")
  -- js styling
  use { "vim-scripts/JavaScript-Indent", ft = "javascript" }
  use { "pangloss/vim-javascript", ft = { "javascript", "html" } }
  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("nvim-treesitter/playground")
  -- Nice diagnostics
  use("glepnir/lspsaga.nvim")
  use("simrat39/symbols-outline.nvim")
  -- Markdown Previewer
  use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        {
          plugins = {
            marks = false, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
              enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
              suggestions = 20, -- how many suggestions should be shown in the list?
            },
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            presets = {
              operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
              motions = true, -- adds help for motions
              text_objects = true, -- help for text objects triggered after entering an operaor
              windows = true, -- default bindings on <c-w>
              nav = true, -- misc bindings to work with windows
              z = true, -- bindings for folds, spelling and others prefixed with z
              g = true, -- bindings for prefixed with g
            },
          },
          -- add operators that will trigger motion and text object completion
          -- to enable all native operators, set the preset / operators plugin above
          operators = { gc = "Comments" },
          key_labels = {
            -- override the label used to display some keys. It doesn't effect WK in any other way.
            -- For example:
            -- ["<space>"] = "SPC",
            -- ["<cr>"] = "RET",
            -- ["<tab>"] = "TAB",
          },
          icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
          },
          popup_mappings = {
            scroll_down = '<c-d>', -- binding to scroll down inside the popup
            scroll_up = '<c-u>', -- binding to scroll up inside the popup
          },
          window = {
            border = "none", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0
          },
          layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "left", -- align columns left, center or right
          },
          ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
          hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
          show_help = true, -- show help message on the command line when the popup is visible
          triggers = "auto", -- automatically setup triggers
          -- triggers = {"<leader>"} -- or specify a list manually
          triggers_blacklist = {
            -- list of mode / prefixes that should never be hooked by WhichKey
            -- this is mostly relevant for key maps that start with a native binding
            -- most people should not need to change this
            i = { "j", "k" },
            v = { "j", "k" },
          },
        }
      })
    end,
  })
  -- use({
  --   "jose-elias-alvarez/null-ls.nvim",
  --   config = function()
  --     require("null-ls").setup()
  --   end,
  --   requires = { "nvim-lua/plenary.nvim" },
  -- })
  -- Simple plugins can be specified as strings
  -- use '9mm/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }

  -- Plugins can have dependencies on other plugins
  -- use {
  --   'haorenW1025/completion-nvim',
  --   opt = true,
  --   requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  -- }

  -- Plugins can also depend on rocks from luarocks.org:
  -- use {
  --   'my/supercoolplugin',
  --   rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  -- }

  -- You can specify rocks in isolation
  -- use_rocks 'penlight'
  -- use_rocks {'lua-resty-http', 'lpeg'}

  -- Local plugins can be included
  -- use '~/projects/personal/hover.nvim'

  -- Plugins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  -- use {
  -- 'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
  -- requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  -- Use dependency and run lua function after load
  -- use {
  -- 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  -- config = function() require('gitsigns').setup() end
  -- }

  -- You can specify multiple plugins in a single call
  -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- You can alias plugin names
  -- use {'dracula/vim', as = 'dracula'}
end)
