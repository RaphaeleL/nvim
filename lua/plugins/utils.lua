return {
    {
        "terrortylor/nvim-comment",
        event = "VeryLazy",
        config = function()
            require("nvim_comment").setup()
        end,
        keys = {
            { "<Leader>l", ":CommentToggle<cr>", desc = "(NaaVim) Comment Selection" }
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
        "windwp/nvim-spectre",
        lazy = true,
        keys = {
            { "<leader>S", ":lua require('spectre').open()<cr>" },
        }
    },
    -- {
    --     "folke/which-key.nvim",
    --     lazy = true,
    --     keys = {
    --         { "<leader><leader>", ":WhichKey<cr>", desc = "(NaaVim) Open WhichKey" },
    --     },
    --     config = function()
    --         vim.o.timeout = true
    --         vim.o.timeoutlen = 300
    --         require("which-key").setup({ })
    --     end,
    -- },
}
