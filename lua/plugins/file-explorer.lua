return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        keys = {
            { "<leader>sf", ":Telescope find_files theme=dropdown<cr>", desc = "(NaaVim) Telescope: [S]how [F]uzzy File Finder" },
            { "<leader>sl", ":Telescope live_grep theme=dropdown<cr>", desc = "(NaaVim) Telescope: [S]how [L]ive Grep" },
            { "<leader>sg", ":Telescope git_files theme=dropdown<cr>", desc = "(NaaVim) Telescope: [S]how [G]it Files" },
            { "<leader>sb", ":Telescope buffers theme=dropdown<cr>", desc = "(NaaVim) Telescope: [S]how Buffers" },
            { "<leader>sd", ":Telescope diagnostics theme=dropdown<cr>", desc = "(NaaVim) Telescope: [S]how [D]iagnostics" },
            { "<leader>ss", ":Telescope grep_string theme=dropdown<cr>", desc = "(NaaVim) Telescope: [S]how [G]rep" },
            { "<leader>so", ":Telescope lsp_document_symbols theme=dropdown<cr>", desc = "(NaaVim) Telescope: [S]how [O]utliner" },
            { "<leader>sk", ":Telescope keymaps theme=dropdown<cr>", desc = "(NaaVim) Telescope: [S]how [K]eymaps" },
            { "<leader>?", ":Telescope oldfiles theme=dropdown<cr>", desc = "(NaaVim) Telescope: Show Oldfiles" },
            { "<leader>/", ":lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<cr>", desc = "(NaaVim) Telescope: Search in the Current File" },
        },
        config = function()
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                        ".DS_Store"
                    }
                },
            })
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        keys = {
            { "<leader>e", ":NvimTreeToggle<cr>", desc = "(NaaVim) UI: File Explorer" },
        },
        config = function()
            local tree = require("nvim-tree")
            tree.setup({
                hijack_cursor = true,
                open_on_setup = true,
                open_on_setup_file = true,
                sync_root_with_cwd = true,
                view = {
                    adaptive_size = true,
                },
                renderer = {
                    full_name = true,
                    group_empty = true,
                    special_files = {},
                    symlink_destination = false,
                    indent_markers = {
                        enable = true,
                    },
                },
            })
        end
    },
}
