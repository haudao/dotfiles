call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'

" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'mcchrish/nnn.vim'
Plug 'justinmk/vim-sneak'

" Misc
Plug 'psliwka/vim-smoothie'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'jxnblk/vim-mdx-js'

" Autocomplete
Plug 'hrsh7th/nvim-compe'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Status line
Plug 'hoob3rt/lualine.nvim'

" Git
Plug 'tpope/vim-fugitive'

call plug#end()

