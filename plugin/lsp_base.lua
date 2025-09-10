-- https://github.com/Rishabh672002/Neovim/blob/main/lua%2Frj%2Flsp.lua
-- https://github.com/NTBBloodbath/nvim/blob/main/lua/core/lsp.lua
-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp

-- Diagnostics
local config = {
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.HINT] = "H",
            [vim.diagnostic.severity.INFO] = "I",
        },
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "single",
        source = "always",
        header = "",
        prefix = "",
        suffix = "",
    },
}
vim.diagnostic.config(config)

-- LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.semanticTokens.multilineTokenSupport = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Disable the default keybinds
for _, bind in ipairs({ "grn", "gra", "gri", "grr" }) do
    pcall(vim.keymap.del, "n", bind)
end
