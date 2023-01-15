-- ============================================
--      LANGUAGE SERVER PROTOCOL
-- ============================================
--
-- TODO: is this able to lazy load? Somehow only
-- load if a lsp supported file is open. The
-- startup time for the mentioned file would be
-- halved!
--
return {
    {
        "VonHeikemen/lsp-zero.nvim",
        enabled = true,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
        },
    },
}
