local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  print("Couldn't require lsp-zero")
  return
end

lsp.preset('recommended')

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

lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

local enable_virtualtext = false
local enable_autoformat = false

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "sa", ":lua vim.lsp.buf.code_action()<cr>", opts)
  vim.keymap.set("n", "sl", ":lua vim.diagnostic.open_float()<cr>", opts)
  vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<cr>", opts)
  vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)
  vim.keymap.set("n", "gn", ":lua vim.diagnostic.goto_next()<cr>zz", opts)
  vim.keymap.set("n", "gp", ":lua vim.diagnostic.goto_prev()<cr>zz", opts)
  vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<cr>", opts)
  vim.keymap.set("n", "<leader>k", ":lua vim.lsp.buf.signature_help()<cr>", opts)
  -- vim.keymap.set("n", "ff", ":silent Format<cr>", opts)
  vim.keymap.set("n", "ff", ":silent LspZeroFormat!<cr>", opts)
  vim.keymap.set("n", "ft", ":silent FormatToggleAuto<cr>", opts)
  vim.keymap.set("n", "vt", ":silent VirtualTextToggle<cr>:silent write<cr>", opts)

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })

  -- Create a command `:EnableAutoformat` to Toggle the Autoformatter
  vim.api.nvim_buf_create_user_command(bufnr, 'FormatToggleAuto', function(_)
    enable_autoformat = not enable_autoformat
  end, { desc = 'Auto Format current buffer with LSP' })

  -- Create a command ':VirtualTextToggle' to Toggle the Virtual Text
  vim.api.nvim_buf_create_user_command(bufnr, 'VirtualTextToggle', function(_)
    enable_virtualtext = not enable_virtualtext
  end, { desc = 'Toggle the Virtual Text LSP' })

end)

-- Some LSP Autocommands
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    vim.diagnostic.config({ virtual_text = enable_virtualtext })
    if enable_autoformat then
      vim.lsp.buf.format({ async = true })
    end
  end,
})

lsp.setup()
