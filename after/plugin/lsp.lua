local lsp = require('lsp-zero')

lsp.preset('recommended')

vim.diagnostic.config({ virtual_text = true })

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
  'bashls',
  'clangd',
  'cmake',
  'jsonls',
  'ltex',
  'sumneko_lua',
  'marksman',
  'pyright',
  'rust_analyzer',
  'yamlls',
})

lsp.setup()
