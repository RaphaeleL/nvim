return {
    -- {
    --     "rebelot/kanagawa.nvim",
    --     lazy = true,
    --     config = function()
    --         require("kanagawa").setup({ transparent = true })
    --     end
    -- },
    -- {
    --     "rose-pine/neovim",
    --     lazy = true,
    --     config = function()
    --         require("rose-pine").setup({ disable_background = true })
    --     end
    -- },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     lazy = true,
    --     config = function()
    --         require("catppuccin").setup({ transparent_background = true })
    --     end
    -- },
    {
        "RaphaeleL/my_vivid",
        -- event = "VeryLazy",
        config = function()
            vim.cmd("colorscheme my_vivid")
            vim.cmd("hi @field guifg=#89A5AC")
            vim.cmd("hi @parameter guifg=#77B0DA")
        end
    },
    -- {
    --     dir = "~/Developer/vscode.nvim/",
    --     lazy = true,
    -- },
}
