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
}
