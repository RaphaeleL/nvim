-- Highlight Yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

-- Keymaps for LSP
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspAttach", {}),
    callback = function()
        local opts = { remap = false }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<F3>", ":lua vim.lsp.buf.format()<cr>", { desc = "LSP: Format" })
        vim.keymap.set("n", "<F4>", function() vim.lsp.buf.code_action() end, opts)
    end
})
