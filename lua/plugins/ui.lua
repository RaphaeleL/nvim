return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
        keys = {
            { "<leader>i", ":IlluminateToggle<cr>:IndentBlanklineToggle<cr>", desc = "UI: Toggle" },
        },
    },
    {
        "RRethy/vim-illuminate",
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
