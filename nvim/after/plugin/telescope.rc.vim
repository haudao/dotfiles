if !exists('g:loaded_telescope')
  finish
endif

nnoremap <silent> <leader>p <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>f <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>b <cmd>Telescope buffers<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_mru = true
    }
  }
}

require('telescope').load_extension('fzf')
EOF
