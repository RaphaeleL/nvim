vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" }, { confirm = false })
vim.pack.add({ "https://github.com/mason-org/mason.nvim" }, { confirm = false })
vim.pack.add({ "https://github.com/mason-org/mason-lspconfig.nvim" }, { confirm = false })
vim.pack.add({ "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" }, { confirm = false })

-- see `:h lspconfig-all` for available servers and their settings
local lsp_servers = {
    lua_ls = { Lua = { workspace = { library = vim.api.nvim_get_runtime_file("lua", true) }}},
    clangd = {}
}

for server, config in pairs(lsp_servers) do
    vim.lsp.enable(server)
    vim.lsp.config(server, { settings = config })
end

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.HINT] = "H",
        },
    },
    virtual_text = true,
})
