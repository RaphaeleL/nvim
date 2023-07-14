return {
    {
        "terrortylor/nvim-comment",
        event = "VeryLazy",
        config = function()
            require("nvim_comment").setup()
        end,
        keys = {
            { "<Leader>l", ":CommentToggle<cr>", desc = " Comment Selection" }
        }
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        "jinh0/eyeliner.nvim",
        event = "VeryLazy",
        config = function()
            require("eyeliner").setup {
                highlight_on_key = true,
                dim = false
            }
            vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = "#ff00ff", bold = true, underline = false })
            vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = "#00ffff", underline = false })
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            plugins = { spelling = true },
            defaults = {
                mode = { "n", "v" },
                ["<leader>r"] = { name = "Rename" },
                ["<leader>c"] = { name = "Compile" },
                ["<leader>f"] = { name = "+File" },
                ["<leader>g"] = { name = "+Git" },
                ["<leader>s"] = { name = "+Telescope" },
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)
        end,
    },

}
