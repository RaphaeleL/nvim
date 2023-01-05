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
        lazy = true,
    }
}
