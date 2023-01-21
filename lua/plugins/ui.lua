return {
    {
        "rcarriga/nvim-notify",
        lazy = true,
        config = function()
            require("notify").setup({
                background_colour = "#000000",
                render = "minimal",
            })
        end
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
        -- event = "VeryLazy",
        lazy = true,
        keys = {
            { "<leader>i", ":IlluminateToggle<cr>:IndentBlanklineToggle<cr>", desc = "UI: Toggle" },
        },
    },
    {
        "RRethy/vim-illuminate",
        -- event = "VeryLazy",
        lazy = true,
        keys = {
            { "<leader>i", ":IlluminateToggle<cr>:IndentBlanklineToggle<cr>", desc = "UI: Toggle" },
        },
        config = function()
            require("illuminate")
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    {
        "mrjones2014/nvim-ts-rainbow",
        event = "VeryLazy",
    },
}
