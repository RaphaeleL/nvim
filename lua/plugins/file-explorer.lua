return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        keys = {
            { "<leader>sf", ":Telescope find_files theme=ivy<cr>", desc = " Telescope: [S]how [F]uzzy File Finder" },
            { "<leader>sl", ":Telescope live_grep theme=ivy<cr>", desc = " Telescope: [S]how [L]ive Grep" },
            { "<leader>sg", ":Telescope git_files theme=ivy<cr>", desc = " Telescope: [S]how [G]it Files" },
            { "<leader>sb", ":Telescope buffers theme=ivy<cr>", desc = " Telescope: [S]how Buffers" },
            { "<leader>sd", ":Telescope diagnostics theme=ivy<cr>", desc = " Telescope: [S]how [D]iagnostics" },
            { "<leader>ss", ":Telescope grep_string theme=ivy<cr>", desc = " Telescope: [S]how [G]rep" },
            { "<leader>so", ":Telescope lsp_document_symbols theme=ivy<cr>", desc = " Telescope: [S]how [O]utliner" },
            { "<leader>sk", ":Telescope keymaps theme=ivy<cr>", desc = " Telescope: [S]how [K]eymaps" },
            { "<leader>sm", ":Telescope harpoon marks theme=ivy<cr>", desc = " [S]how [M]ark Menu" },
            { "<leader>sc", ":Telescope colorscheme theme=ivy<cr>", desc = " Telescope: [S]how [C]olorscheme" },
            { "<leader>s?", ":Telescope oldfiles theme=ivy<cr>", desc = " Telescope: Show Oldfiles" },
            { "<leader>s/", ":lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy { winblend = 10, previewer = false, })<cr>", desc = " Telescope: Search in the Current File" },
        },
        config = function()
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                        ".DS_Store"
                    }
                },
                pickers = {
                    find_files = {
                        theme = "ivy",
                    },
                    colorscheme = {
                        enable_preview = true
                    }
              },
            })
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            local tree = require("nvim-tree")
            tree.setup({
                hijack_cursor = true,
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
        end,
    },
}
