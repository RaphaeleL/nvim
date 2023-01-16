return {
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        config = function()
            require("kanagawa").setup({ transparent = true })
        end
    },
    {
        "rose-pine/neovim",
        lazy = true,
        config = function()
            require("rose-pine").setup({ disable_background = true })
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        config = function()
            require("catppuccin").setup({ transparent_background = true })
        end
    },
    {
        "RaphaeleL/vivid.nvim",
        name = "vivid",
        lazy = true,
    },
}
