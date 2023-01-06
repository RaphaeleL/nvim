return {
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
        "rcarriga/nvim-notify",
        enabled = true,
    },
    {
        "mrjones2014/nvim-ts-rainbow",
        event = "VeryLazy",
    },
}
