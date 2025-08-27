return {
    "mason-org/mason.nvim",
    -- dependencies = {
    --     { "mason-org/mason-lspconfig.nvim", opts={} },
    --     { "neovim/nvim-lspconfig", opts={} },
    -- },
    opts = {
        ensure_installed = {
            "lua_ls",
            "pyright-langserver",
            "gopls",
            "clangd",
            "rust_analyzer",
            "bashls",
            "ts_ls",
            "cssls",
            "tailwindcssls",
            "htmlls",
            "jdtls",
        },
    },
}
