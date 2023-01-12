return {
    {
        "tamago324/lir.nvim",
        lazy = true,
        keys = {
            { "e", ":edit %:h<cr>" },
            { "E", ":lua require('lir.float').toggle()<cr>" },
        }
    },
    {
        "tamago324/lir-git-status.nvim",
        lazy = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        keys = {
            { "t", ":Telescope find_files<cr>", desc = "Telescope: Open Fuzzy File Finder" },
            { "tl", ":Telescope live_grep<cr>", desc = "Telescope: Open Fuzzy File Finder - Live Grep" },
            { "tg", ":Telescope git_files<cr>", desc = "Telescope: Open Fuzzy File Finder - Git Files" },
            { "tb", ":Telescope buffers<cr>", desc = "Telescope: Open Fuzzy File Finder - Buffers" },
            { "td", ":Telescope diagnostics<cr>", desc = "Telescope: Open Fuzzy File Finder - Diagnostics" },
            { "tw", ":Telescope grep_string<cr>", desc = "Telescope: Open Fuzzy File Finder - Grep" },
            { "ts", ":Telescope lsp_document_symbols<cr>", desc = "Telescope: Open Fuzzy File Finder - Outliner" },
        }
    },
}
