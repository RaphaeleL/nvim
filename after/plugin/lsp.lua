local ok, lsp = pcall(require, "lsp-zero")
if not ok then
    print("Couldn't require lsp-zero")
    return
end

lsp.preset('recommended')

lsp.set_preferences({
    suggest_lsp_servers = true,
    underline = false,
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

local enable_virtualtext = true
local enable_autoformat = false

lsp.on_attach(function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    -- My Keymaps
    nmap("ca", ":lua vim.lsp.buf.code_action()<cr>", "[C]ode [A]ction")
    nmap("od", ":lua vim.diagnostic.open_float()<cr>", "[O]pen [D]iagnostics")
    nmap("gr", ":lua vim.lsp.buf.references()<cr>", "[G]oto [R]eference")
    nmap("gd", ":lua vim.lsp.buf.definition()<cr>", "[G]oto [D]efinition")
    nmap("gn", ":lua vim.diagnostic.goto_next()<cr>zz", "[G]oto [N]ext Diagnostic")
    nmap("gp", ":lua vim.diagnostic.goto_prev()<cr>zz", "[G]oto [P]revious Diagnostic")
    nmap("K", ":lua vim.lsp.buf.hover()<cr>", "Hover Documentation")
    nmap("<leader>k", ":lua vim.lsp.buf.signature_help()<cr>", "Signature Documentation")
    nmap("ff", ":silent LspZeroFormat!<cr>", "[F]ormat [F]ile")
    nmap("ft", ":silent FormatToggleAuto<cr>", "[F]ormat File [T]oggle")
    nmap("vt", ":silent VirtualTextToggle<cr>:silent write<cr>", "[V]irtual Line Diagnostics [T]oggle")

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
