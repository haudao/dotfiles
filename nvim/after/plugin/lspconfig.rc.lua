local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')
local null_ls = require('null-ls')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

  -- Formatting on save
  client.resolved_capabilities.document_formatting = true
  client.resolved_capabilities.document_range_formatting = true
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> EslintFixAll]]
    vim.api.nvim_command [[augroup END]]
  end

  -- protocol.SymbolKind = { }
  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
end

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    on_attach(client, bufnr)
  end,
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
}

-- Formatting config
local filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'markdown', 'markdown.mdx' }
nvim_lsp.eslint.setup {
  on_attach = on_attach,
  filetypes = filetypes
}

-- Hide lsp diagnostics
vim.diagnostic.config {
  virtual_text = false,
}
