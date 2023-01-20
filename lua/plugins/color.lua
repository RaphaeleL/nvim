return {
    -- {
    --     "rebelot/kanagawa.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("kanagawa").setup({ transparent = true })
    --         vim.cmd("colorscheme kanagawa")
    --     end
    -- },
    -- {
    --     "rose-pine/neovim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("rose-pine").setup({ disable_background = true })
    --         vim.cmd("colorscheme rose-pine")
    --     end
    -- },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     event = "VeryLazy",
    --     config = function()
    --         require("catppuccin").setup({ transparent_background = true })
    --         vim.cmd("colorscheme catppuccin")
    --     end
    -- },
    {
        "RaphaeleL/my_vivid",
        config = function()
            vim.cmd("colorscheme my_vivid")
            vim.cmd("hi @field guifg=#89A5AC")
            vim.cmd("hi @parameter guifg=#77B0DA")
        end
    },
    -- {
    --     dir = "~/Developer/vscode.nvim/",
    --     event = "VeryLazy",
    --     config = function()
    --         vim.cmd("colorscheme vscode")
    --     end
    -- },
}
