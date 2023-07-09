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
        "jinh0/eyeliner.nvim",
        event = "VeryLazy",
        config = function()
            require("eyeliner").setup {
                highlight_on_key = true,
                dim = false
            }
            vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#ff00ff', bold = true, underline = false })
            vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#00ffff', underline = false })
        end
    },
}
