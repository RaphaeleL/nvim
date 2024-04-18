return {
    "rose-pine/neovim",
    config = function()
        require("rose-pine").setup({
            variant = "main",
            dim_nc_background = true,
            disable_background = true,
            groups = {
                background = "transparent",
                background_nc = "transparent",
                -- panel = "transparent",
                panel_nc = "transparent",
                border = "transparent",
            },
        })
        vim.cmd("colorscheme rose-pine")
    end

    -- "catppuccin/nvim",
    -- name = "catppuccin",
    -- config = function()
    --     require("catppuccin").setup({
    --         background = {
    --             light = "latte",
    --             dark = "mocha",
    --         },
    --         transparent_background = true,
    --         integrations = {
    --             illuminate = true
    --         }
    --     })
    --     -- vim.cmd("colorscheme catppuccin")
    -- end

    -- "rebelot/kanagawa.nvim",
    -- event = "VeryLazy",
    -- config = function()
    --     require("kanagawa").setup({
    --         transparent = true,
    --         overrides = function(colors)
    --             return {
    --                 StatusLine = { bg = "NONE" },
    --                 StatusLineNC = { bg = "NONE" },
    --                 TabLineSel = { bg = "NONE" },
    --                 LineNr = { bg = "NONE" },
    --                 CursorLineNr = { bg = "NONE" },
    --                 SignColumn = { bg = "NONE" },
    --                 GitSignsAdd = { bg = "NONE" },
    --                 GitSignsChange = { bg = "NONE" },
    --                 GitSignsDelete = { bg = "NONE" },
    --                 DiagnosticSignError = { bg = "NONE" },
    --                 DiagnosticSignWarn = { bg = "NONE" },
    --                 DiagnosticSignInfo = { bg = "NONE" },
    --                 DiagnosticSignHint = { bg = "NONE" },
    --                 TelescopeBorder = { bg = "NONE" },
    --                 TelescopeTitle = { fg = colors.theme.ui.special, bold = true },
    --                 TelescopePromptNormal = { bg = colors.theme.ui.bg_p1 },
    --                 TelescopePromptBorder = { fg = colors.theme.ui.bg_p1, bg = colors.theme.ui.bg_p1 },
    --                 TelescopeResultsNormal = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m1 },
    --                 TelescopeResultsBorder = { fg = colors.theme.ui.bg_m1, bg = colors.theme.ui.bg_m1 },
    --                 TelescopePreviewNormal = { bg = colors.theme.ui.bg_dim },
    --                 TelescopePreviewBorder = { bg = colors.theme.ui.bg_dim, fg = colors.theme.ui.bg_dim },
    --             }
    --         end,
    --         background = {
    --             dark = "dragon",
    --             light = "lotus"
    --         }
    --     })
    --     vim.cmd("colorscheme kanagawa")
    -- end
}
