return {
    {
        "lewis6991/gitsigns.nvim",
        -- lazy = true,
        event = "VeryLazy",
        opts = {
            -- numhl = true,
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "󰐊" },
                topdelete = { text = "󰐊" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
        },
        keys = {
            { "<Leader>gR", ":Gitsigns toggle_deleted<cr>", desc = " Gitsigns: [G]it [t]oggle deleted" },
            { "<Leader>gn", ":Gitsigns toggle_numhl<cr>",   desc = " Gitsigns: [G]it [t]oggle Line Number Signs" },
            { "<Leader>gs", ":Gitsigns toggle_signs<cr>",   desc = " Gitsigns: [G]it [t]oggle Signs" },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        -- lazy = true,
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            if vim.fn.has("nvim-0.10.0") == 0 then
                local utils = require("ibl.utils")
                ---@diagnostic disable-next-line: deprecated
                utils.tbl_join = vim.tbl_flatten
            end
            require("ibl").setup({
                indent = {
                    char = "│",
                    tab_char = "│",
                },
                scope = {
                    enabled = false,
                    show_start = false,
                    show_end = false,
                    injected_languages = false,
                    show_exact_scope = false,
                },
                exclude = {
                    filetypes = {
                        "alpha",
                        "checkhealth",
                        "dashboard",
                        "git",
                        "gitcommit",
                        "help",
                        "lazy",
                        "lazyterm",
                        "lspinfo",
                        "man",
                        "mason",
                        "neo-tree",
                        "notify",
                        "Outline",
                        "TelescopePrompt",
                        "TelescopeResults",
                        "terminal",
                        "toggleterm",
                        "Trouble",
                    },
                },
            })
        end,
    },
    {
        "RRethy/vim-illuminate",
        -- lazy = true,
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            delay = 0,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" },
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- "rcarriga/nvim-notify",
        },
        opts = {
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
            cmdline = {
                enabled = true,
                view = "cmdline",
                opts = {},
                format = {
                    cmdline = { pattern = "^:", icon = "", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    input = { view = "cmdline_input", icon = "󰥻 " },
                },
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                    progress = {
                        enabled = true,
                        format = "lsp_progress",
                        format_done = "lsp_progress_done",
                        throttle = 1000 / 30,
                        view = "mini",
                    }
                }
            }
        }
    },
}
