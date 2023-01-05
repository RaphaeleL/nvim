return {
    {
        "tamago324/lir.nvim",
        lazy = true,
        keys = {
            { "e", ":lua require'lir.float'.toggle()<cr>" },
            -- { "<leader>t", ":lua require'lir.float'.toggle()<cr>" },
            -- { "e", ":edit %:h<cr>" },
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
            { "t", ":Telescope find_files<cr>" },
            { "tl", ":Telescope live_grep<cr>" },
            { "tg", ":Telescope git_files<cr>" },
            { "tb", ":Telescope buffers<cr>" },
            { "td", ":Telescope diagnostics<cr>" },
            { "tw", ":Telescope grep_string<cr>" },
            { "ts", ":Telescope lsp_document_symbols<cr>" },
        }
    },
}
