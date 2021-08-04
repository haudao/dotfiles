if !exists('g:loaded_lspsaga')
  finish
endif

lua << EOF

local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

EOF

" show hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>

" show signature help
nnoremap <silent> gs :Lspsaga signature_help<CR>

" preview definition
nnoremap <silent> gp :Lspsaga preview_definition<CR>

" rename
nnoremap <silent>gr :Lspsaga rename<CR>

" async lsp
nnoremap <silent> gh :Lspsaga lsp_finder<CR>

" jump to next diagnostic
nnoremap <silent> ]e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_prev<CR>

" show cursor diagnostic
nnoremap <silent> sd :Lspsaga show_line_diagnostics<CR>

" code action
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
