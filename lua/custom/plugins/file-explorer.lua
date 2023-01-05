return {
    {
        "tamago324/lir.nvim",
        lazy = true,
        keys = {
            { "<leader>t", ":lua require'lir.float'.toggle()<cr>" },
        }
    },
    {
        "tamago324/lir-git-status.nvim",
        lazy = true,
    },
    {
        "tamago324/lir-mmv.nvim",
        lazy = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        keys = {
            { "e", ":Telescope find_files<cr>" },
            { "el", ":Telescope live_grep<cr>" },
            { "eg", ":Telescope git_files<cr>" },
            { "sb", ":Telescope buffers<cr>" },
            { "sd", ":Telescope diagnostics<cr>" },
            { "sw", ":Telescope grep_string<cr>" },
            { "ds", ":Telescope lsp_document_symbols<cr>" },
        }
    },
}
