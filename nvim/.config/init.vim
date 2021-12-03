" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin('~/.local/share/nvim/plugged')
" T-Pope plugs
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible', { 'branch': 'master' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Linting and stuff
Plug 'rust-lang/rust.vim'
" Solarized theme
" Gruvbox theme
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
" Git gutter - maybe can do better
" Plug 'vim-airline/vim-airline'
" Plug 'airblade/vim-gitgutter'
" Git gutter replacement
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Harpoon
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'
" Telescopic Stuff
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Try again
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()
" ==========================================================
" EXTRA LUA CONFIG
" ==========================================================
lua require("pman")
augroup filconfig
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
    autocmd FileType json setlocal shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType html       setlocal shiftwidth=2 tabstop=2
    autocmd FileType python     setlocal shiftwidth=4 softtabstop=4 expandtab
augroup END
