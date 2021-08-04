"""""""""""""""""""""""""""""
"==== Vim Configuration ===="
"""""""""""""""""""""""""""""

language en_gb

"""""""""""""""""""""""""""""
"===== Install plugins ====="
"""""""""""""""""""""""""""""
filetype off

runtime ./plug.vim

"""""""""""""""""""""""""""""
"== Configuration Session =="
"""""""""""""""""""""""""""""

" Show linenumbers
set number
set relativenumber
set ruler

" Set Proper Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set scrolloff=10
set lazyredraw
set splitright
set splitbelow

" Enable highlighting of the current line
set cursorline

" Use system clipboard
set clipboard=unnamed

" Auto complete
set completeopt=menuone,noselect

" Theme
if !exists('g:syntax_on')
  syntax enable
endif

if (has("termguicolors"))
  set termguicolors
endif

set t_Co=256
set background=dark

set encoding=utf8
set guifont=Operator\ Mono\ Light\ Nerd\ Font\ Complete:h11

let base16colorspace=256               " access colors present in 256 colorspace
colorscheme base16-tomorrow-night

let $MYVIMRC = '$HOME/.config/nvim/init.vim'

" Run map
runtime ./maps.vim

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true
