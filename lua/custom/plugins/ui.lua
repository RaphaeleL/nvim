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
        event = "VeryLazy",
    },
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
    }
}
