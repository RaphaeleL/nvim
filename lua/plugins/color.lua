return {
    -- ========================================
    --      My Own Colorscheme
    -- ========================================
    -- {
    --     "RaphaeleL/my_vivid",
    --     config = function()
    --         vim.cmd("colorscheme my_vivid")
    --         vim.cmd("hi @field guifg=#89A5AC")
    --         vim.cmd("hi @parameter guifg=#77B0DA")
    --     end
    -- },
    -- ========================================
    --      Some cool basic Colorschemes
    -- ========================================
    -- {
    --     "rebelot/kanagawa.nvim",
    --     config = function()
    --         require("kanagawa").setup({ 
    --             transparent = true,
    --             background = {
    --                 dark = "wave", 
    --                 light = "lotus"
    --             }
    --         })
    --         vim.cmd("colorscheme kanagawa")
    --     end
    -- },
    -- {
    --     "rose-pine/neovim",
    --     config = function()
    --         require("rose-pine").setup({ disable_background = true })
    --         vim.cmd("colorscheme rose-pine")
    --     end
    -- },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({ 
                background = {
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true,
                integrations = {
                    illuminate = true
                }
            })
            vim.cmd("colorscheme catppuccin")
        end
    },
    -- ========================================
    --      Auto Dark / Light Colorscheme
    -- ========================================
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     event = "VeryLazy",
    --     config = function()
    --         require("catppuccin").setup({
    --             background = {
    --                 light = "latte",
    --                 dark = "mocha",
    --             },
    --             transparent_background = true,
    --             integrations = {
    --                 illuminate = true
    --             }
    --         })
    --         vim.cmd("colorscheme catppuccin")
    --     end
    -- },
    -- {
    --     "f-person/auto-dark-mode.nvim",
    --     config = function()
    --         local auto_dark_mode = require('auto-dark-mode')
    --
    --         auto_dark_mode.setup({
    --             update_interval = 1000,
    --             set_dark_mode = function()
    --                 vim.api.nvim_set_option('background', 'light')
    --                 vim.cmd("colorscheme catppuccin")
    --             end,
    --             set_light_mode = function()
    --                 vim.api.nvim_set_option('background', 'light')
    --                 vim.cmd("colorscheme catppuccin")
    --             end,
    --         })
    --         auto_dark_mode.init()
    --     end
    -- },
}
