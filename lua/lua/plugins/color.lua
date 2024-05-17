return {
    -- {
    --     "rebelot/kanagawa.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("kanagawa").setup({
    --             transparent = true,
    --             overrides = function(colors)
    --                 return {
    --                     StatusLine = { bg = "NONE" },
    --                     StatusLineNC = { bg = "NONE" },
    --                     TabLineSel = { bg = "NONE" },
    --                     LineNr = { bg = "NONE" },
    --                     CursorLineNr = { bg = "NONE" },
    --                     SignColumn = { bg = "NONE" },
    --                     GitSignsAdd = { bg = "NONE" },
    --                     GitSignsChange = { bg = "NONE" },
    --                     GitSignsDelete = { bg = "NONE" },
    --                     DiagnosticSignError = { bg = "NONE" },
    --                     DiagnosticSignWarn = { bg = "NONE" },
    --                     DiagnosticSignInfo = { bg = "NONE" },
    --                     DiagnosticSignHint = { bg = "NONE" },
    --                     TelescopeBorder = { bg = "NONE" },
    --                     TelescopeTitle = { fg = colors.theme.ui.special, bold = true },
    --                     TelescopePromptNormal = { bg = colors.theme.ui.bg_p1 },
    --                     TelescopePromptBorder = { fg = colors.theme.ui.bg_p1, bg = colors.theme.ui.bg_p1 },
    --                     TelescopeResultsNormal = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m1 },
    --                     TelescopeResultsBorder = { fg = colors.theme.ui.bg_m1, bg = colors.theme.ui.bg_m1 },
    --                     TelescopePreviewNormal = { bg = colors.theme.ui.bg_dim },
    --                     TelescopePreviewBorder = { bg = colors.theme.ui.bg_dim, fg = colors.theme.ui.bg_dim },
    --                     Todo = { bg = colors.theme.ui.bg_p2 },
    --                     VisualNonText = { fg = colors.theme.ui.bg_p3, bg = "#223249" },
    --                 }
    --             end,
    --             background = {
    --                 dark = "dragon",
    --                 light = "lotus"
    --             }
    --         })
    --         vim.cmd("colorscheme kanagawa")
    --     end
    -- },
    -- {
    --     "scottmckendry/cyberdream.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("cyberdream").setup({
    --             transparent = true,
    --             italic_comments = true,
    --             hide_fillchars = true,
    --             borderless_telescope = true,
    --             terminal_colors = true,
    --         })
    --         vim.cmd("colorscheme cyberdream")
    --     end,
    -- },
    -- {
    --     "rose-pine/neovim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("rose-pine").setup({
    --             variant = "auto",
    --             dark_variant = "main",
    --             dim_nc_background = true,
    --             disable_background = true,
    --             styles = {
    --                 bold = true,
    --                 italic = true,
    --                 transparency = true,
    --             },
    --             groups = { },
    --             highlight_groups = {
    --                 StatusLine = { bg = "NONE" },
    --                 StatusLineNC = { bg = "NONE" },
    --                 CursorLineNr = { fg = "gold" },
    --             },
    --         })
    --         vim.cmd("colorscheme rose-pine")
    --     end
    -- },
    {
        "catppuccin/nvim",
        event = "VeryLazy",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                highlight_overrides = {
                    all = function(colors)
                        return {
                            NvimTreeNormal = { fg = colors.none },
                            CmpBorder = { fg = "#3e4145" },
                        }
                    end,
                },
                background = {
                    light = "latte",
                    dark = "mocha",
                },
                show_end_of_buffer = false,
                transparent_background = true,
                integrations = {
                    illuminate = true,
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                }
            })
            vim.cmd("colorscheme catppuccin")
        end
    },
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("gruvbox").setup({
    --             transparent_mode = true,
    --         })
    --         vim.cmd("colorscheme gruvbox")
    --     end
    -- }
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("tokyonight").setup({
    --             transparent = true
    --         })
    --         vim.cmd("colorscheme tokyonight")
    --     end
    -- },
}
