return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        keys = {
            { "<leader>sf", ":Telescope find_files theme=ivy<cr>", desc = " Telescope: [S]how [F]uzzy File Finder" },
            { "<leader>sl", ":Telescope live_grep theme=ivy<cr>", desc = " Telescope: [S]how [L]ive Grep" },
            { "<leader>sg", ":Telescope git_files theme=ivy<cr>", desc = " Telescope: [S]how [G]it Files" },
            { "<leader>sd", ":Telescope diagnostics theme=ivy<cr>", desc = " Telescope: [S]how [D]iagnostics" },

            { "<leader>sb", ":Telescope buffers theme=ivy<cr>", desc = " Telescope: [S]how Buffers" },
            { "<leader>sk", ":Telescope keymaps theme=ivy<cr>", desc = " Telescope: [S]how [K]eymaps" },
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
    {
        "terrortylor/nvim-comment",
        event = "VeryLazy",
        config = function()
            require("nvim_comment").setup()
        end,
        keys = {
            { "<Leader>l", ":CommentToggle<cr>" }
        }
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true
    },
    {
        "nvim-pack/nvim-spectre",
        cmd = "Spectre",
        opts = { open_cmd = "noswapfile vnew" },
        keys = {
            { "<leader>S", function() require("spectre").open() end, desc = "Search and Replace in files" },
        },
    },
    {
        "folke/trouble.nvim",
        "lewis6991/impatient.nvim",
        enabled = true,
    },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        keys = {
            { "<Leader>gg", ":LazyGit<cr>", desc = " [G]it: Lazy[G]it" },
        }
    },
}
