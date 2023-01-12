return {
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
        keys = {
            { "<leader>i", ":IlluminateToggle<cr>:IndentBlanklineToggle<cr>" },
        },
    },
    {
        "RRethy/vim-illuminate",
        lazy = true,
        keys = {
            { "<leader>i", ":IlluminateToggle<cr>:IndentBlanklineToggle<cr>" },
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
