-- ============================================
--      COLORSCHEME COLLECTION
-- ============================================
--
-- if you can't set a transparent background (to
-- create a consistent color scheme through the
-- actual terminal), there is a useful plugin that
-- will do it for you: xiyaowong/nvim-transparent
--
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
        dir = "~/.config/nvim/themes/darkplus",
        lazy = true,
    },
}
