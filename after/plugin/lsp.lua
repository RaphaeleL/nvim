local ok, lsp = pcall(require, "lsp-zero")
if not ok then
    print("Couldn't require lsp-zero")
    return
end

lsp.preset("recommended")

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I"
    }
})

lsp.ensure_installed({
    "tsserver", "eslint", "sumneko_lua",
    "rust_analyzer", "bashls", "clangd",
    "cmake", "jsonls", "sumneko_lua",
    "marksman", "pyright", "yamlls",
})

lsp.configure("sumneko_lua", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

lsp.on_attach(function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then desc = "LSP: " .. desc end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("ca", ":lua vim.lsp.buf.code_action()<cr>", "[C]ode [A]ction")
    nmap("od", ":lua vim.diagnostic.open_float()<cr>", "[O]pen [D]iagnostics")
    nmap("gr", ":lua vim.lsp.buf.references()<cr>", "[G]oto [R]eference")
    nmap("gd", ":lua vim.lsp.buf.definition()<cr>", "[G]oto [D]efinition")
    nmap("gn", ":lua vim.diagnostic.goto_next()<cr>zz", "[G]oto [N]ext Diagnostic")
    nmap("gp", ":lua vim.diagnostic.goto_prev()<cr>zz", "[G]oto [P]revious Diagnostic")
    nmap("K", ":lua vim.lsp.buf.hover()<cr>", "Hover Documentation")
    nmap("<leader>k", ":lua vim.lsp.buf.signature_help()<cr>", "Signature Documentation")
    nmap("ff", ":silent LspZeroFormat!<cr>", "[F]ormat [F]ile")

end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    underline = false
})
