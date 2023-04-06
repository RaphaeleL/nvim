return {
    {
        "nvim-treesitter/playground",
        event = "VeryLazy",
    },
    {
        "nvim-treesitter/nvim-treesitter",
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
    {
        'folke/which-key.nvim',
        opts = {}
    },
    {
        "karb94/neoscroll.nvim",
        opts = {}
    },
    -- {
    --     "fgheng/winbar.nvim",
    --     dependencies = {
    --         "SmiteshP/nvim-gps",
    --         "SmiteshP/nvim-navic",
    --     },
    --     config = function()
    --         require("nvim-gps").setup()
    --         require('winbar').setup({
    --             enabled = true,
    --             show_file_path = true,
    --             show_symbols = true,
    --             colors = {
    --                 path = '',
    --                 file_name = '',
    --                 symbols = '',
    --             },
    --             highlight = true,
    --             separator = ">",
    --             depth_limit = 0,
    --             depth_limit_indicator = "..",
    --             exclude_filetype = {
    --                 'help',
    --                 'startify',
    --                 'dashboard',
    --                 'packer',
    --                 'neogitstatus',
    --                 'NvimTree',
    --                 'Trouble',
    --                 'alpha',
    --                 'lir',
    --                 'Outline',
    --                 'spectre_panel',
    --                 'toggleterm',
    --                 'qf',
    --             }
    --         })
    --     end
    -- }
}
