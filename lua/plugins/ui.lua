return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-context", opts = {} },
        },
        event = "VeryLazy",
        config = function()
            local ok, treesitter = pcall(require, "nvim-treesitter.configs")
            if not ok then
                require("notify")("Couldn't require nvim-treesitter.configs", "error")
                return
            end
            treesitter.setup({
                ensured_installed = {
                    "html", "markdown", "markdown-inline", "bash",
                    "comment", "scss", "css", "html", "javascript",
                    "typescript", "lua", "markdown", "regex", "toml",
                    "yaml", "c", "cpp", "haskell", "java", "python",
                    "rust", "go", "php", "swift", "kotlin", "latex",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                },
                rainbow = {
                    enable = true,
                    colors = {
                        "#68a0b0",
                        "#946EaD",
                        "#c7aA6D",
                    },
                },
            })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        keys = {
            -- { "<leader>i", ":IlluminateToggle<cr>:IndentBlanklineToggle<cr>", desc = "(NaaVim) UI: Toggle" },
            { "<leader>i", ":IndentBlanklineToggle<cr>", desc = "(NaaVim) UI: Toggle" },
        },
    },
    { "nvim-tree/nvim-web-devicons" },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        dependencies = {
            "SmiteshP/nvim-navic",
        },
        opts = {
            show_dirname = false,
        },
    },
    -- {
    --     "RRethy/vim-illuminate",
    --     event = "VeryLazy",
    --     keys = {
    --         { "<leader>i", ":IlluminateToggle<cr>:IndentBlanklineToggle<cr>", desc = "(NaaVim) UI: Toggle" },
    --     },
    --     config = function()
    --         require("illuminate")
    --     end,
    -- },
    -- {
    --     "folke/which-key.nvim",
    --     event = "VeryLazy",
    --     opts = {}
    -- },
    -- {
    --     "karb94/neoscroll.nvim",
    --     event = "VeryLazy",
    --     opts = {}
    -- },
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("noice").setup({
    --             cmdline = {
    --                 view = "cmdline",
    --             },
    --             lsp = {
    --                 progress = {
    --                     enabled = false,
    --                 },
    --                 override = {
    --                     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --                     ["vim.lsp.util.stylize_markdown"] = true,
    --                     ["cmp.entry.get_documentation"] = true,
    --                 },
    --             },
    --             presets = {
    --                 bottom_search = true,
    --                 command_palette = true,
    --                 long_message_to_split = true,
    --                 inc_rename = false,
    --                 lsp_doc_border = false,
    --             },
    --         })
    --     end,
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         "rcarriga/nvim-notify",
    --     }
    -- },
}
