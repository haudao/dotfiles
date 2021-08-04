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
Plug 'glepnir/lspsaga.nvim'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Autocomplete
Plug 'hrsh7th/nvim-compe'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Status line
Plug 'hoob3rt/lualine.nvim'

call plug#end()

