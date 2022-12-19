local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = '',
    warn = '',
    hint = '',
    info = ''
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

lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.setup()


lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  if client.name == "eslint" then
    vim.cmd.LspStop('eslint')
    return
  end

  vim.keymap.set("n", "sa", ":lua vim.lsp.buf.code_action()<cr>", opts)
  vim.keymap.set("n", "sl", ":lua vim.diagnostic.open_float()<cr>", opts)
  vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<cr>", opts)
  vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)
  vim.keymap.set("n", "gn", ":lua vim.diagnostic.goto_next()<cr>zz", opts)
  vim.keymap.set("n", "gp", ":lua vim.diagnostic.goto_prev()<cr>zz", opts)
  vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<cr>", opts)
  vim.keymap.set("n", "<leader>k", ":lua vim.lsp.buf.signature_help()<cr>", opts)
  vim.keymap.set("n", "ff", ":lua vim.lsp.buf.format { async = true }<cr>", opts)

end)

vim.diagnostic.config({ virtual_text = true })
