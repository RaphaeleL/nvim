return {
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
                    "typescript", "lua", "vimdoc", "regex", "toml",
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
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     main = "ibl",
    --     event = "VeryLazy",
    --     opts = {}
    -- },
    -- {
    --     "jinh0/eyeliner.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("eyeliner").setup {
    --             highlight_on_key = true,
    --             dim = false
    --         }
    --         vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = "#ff00ff", bold = true, underline = false })
    --         vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = "#00ffff", underline = false })
    --     end
    -- },
    -- {
    --     "RRethy/vim-illuminate",
    --     event = { "BufReadPost", "BufNewFile" },
    --     opts = {
    --         delay = 200,
    --         large_file_cutoff = 2000,
    --         large_file_overrides = {
    --             providers = { "lsp" },
    --         },
    --     },
    --     config = function(_, opts)
    --         require("illuminate").configure(opts)
    --     end,
    -- },
}
