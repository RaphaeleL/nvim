return {
    {
        "tamago324/lir.nvim",
        lazy = true,
        keys = {
            { "e", ":edit %:h<cr>" },
            { "E", ":lua require('lir.float').toggle()<cr>" },
        },
        dependencies = {
            "tamago324/lir-git-status.nvim"
        }
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        keys = {
            { "<leader>sf", ":Telescope find_files<cr>", desc = "Telescope: [S]how [F]uzzy File Finder" },
            { "<leader>sl", ":Telescope live_grep<cr>", desc = "Telescope: [S]how [L]ive Grep" },
            { "<leader>sg", ":Telescope git_files<cr>", desc = "Telescope: [S]how [G]it Files" },
            { "<leader><space>", ":Telescope buffers<cr>", desc = "Telescope: [S]how Buffers" },
            { "<leader>sd", ":Telescope diagnostics<cr>", desc = "Telescope: [S]how [D]iagnostics" },
            { "<leader>ss", ":Telescope grep_string<cr>", desc = "Telescope: [S]how [G]rep" },
            { "<leader>so", ":Telescope lsp_document_symbols<cr>", desc = "Telescope: [S]how [O]utliner" },
            { "<leader>sk", ":Telescope keymaps<cr>", desc = "Telescope: [S]how [K]eymaps" },
            { "<leader>/",
                ":lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<cr>",
                desc = "Telescope: Search in the Current File" },
            { "<leader>?", ":Telescope oldfiles<cr>", desc = "Telescope: [S]how Oldfiles" },
        }
    },
}
