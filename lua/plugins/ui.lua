return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
    },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
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
