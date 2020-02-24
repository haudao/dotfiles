"""""""""""""""""""""""""""""
"==== Vim Configuration ===="
"""""""""""""""""""""""""""""

language en_gb

"""""""""""""""""""""""""""""
"===== Install plugins ====="
"""""""""""""""""""""""""""""
filetype off

call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'

" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'mcchrish/nnn.vim'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Status line
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'

" Intellisense
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Language support
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jxnblk/vim-mdx-js'

" Misc
Plug 'psliwka/vim-smoothie'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Galooshi/vim-import-js'

call plug#end()

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
set guifont=Fura\ Mono\ Regular\ for\ Powerline\ Nerd\ Font\ Complete\ Mono:h11

let base16colorspace=256               " access colors present in 256 colorspace
colorscheme base16-tomorrow-night

let $MYVIMRC = '$HOME/.config/nvim/init.vim'
let mapleader = ','

" Edit and source configs
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" NNN
" Disable default mappings
let g:nnn#set_default_mappings = 0

" Start nnn in the current file's directory
nnoremap <silent> <C-\> :NnnPicker '%:p:h'<CR>"

" Opens the nnn window in a split
let g:nnn#layout = 'tabnew' 

let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

" Copy path
nnoremap <leader>cp :let @+=expand('%:p')<CR>

" Status line
let g:lightline = {}
let g:lightline.colorscheme = 'wombat'
let g:lightline.component_function = {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \ }
let g:lightline.active = {
      \ 'left': [
      \   [ 'mode', 'paste' ],
      \   [ 'gitbranch', 'readonly', 'filename', 'filetype', 'modified' ]
      \ ],
      \ 'right': [
      \   [ 'lineinfo' ],
      \   [ 'percent' ],
      \   [ 'cocstatus' ],
      \ ]
      \ }

" Vim sneak configs
let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

inoremap jj <Esc>
nnoremap <Space> :
nnoremap \ ,


" Tmux navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" FZF configs
let g:fzf_history_dir = '~/.local/share/fzf-history'
nnoremap <leader>p :Files!<CR>
nnoremap <leader>b :Buffers!<CR>
nnoremap <leader>f :Rg!<CR>
nnoremap <silent> <leader>w :Rg!<C-R><C-W><CR>
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('right:50%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Disable arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
 
" Find and replace
let g:far#source = 'rg'

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
