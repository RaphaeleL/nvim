return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
    },
    {
        "lewis6991/impatient.nvim",
        lazy = true,
    },
    {
        "mbbill/undotree",
        lazy = true,
        keys = {
            { "su", ":UndotreeToggle<cr>" },
        }
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
}
