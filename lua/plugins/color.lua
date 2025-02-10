return {
    -- {
    --     "tjdevries/colorbuddy.nvim",
    --     lazy = true,
    --     priority = 1000,
    -- },
    -- {
    --     "rebelot/kanagawa.nvim",
    --     lazy = true,
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
    --                 light = "lotus",
    --             },
    --         })
    --     end,
    -- },
    {
        "rose-pine/neovim",
        lazy = true,
        config = function()
            require("rose-pine").setup({
                variant = "auto",
                dark_variant = "main",
                dim_inactive_windows = true,
                extend_background_behind_borders = true,
                dim_nc_background = true,
                disable_background = true,
                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                },
                groups = {},
                highlight_groups = {
                    Normal = { bg = "NONE" },
                    NormalNC = { bg = "NONE" },
                    NormalFloat = { bg = "NONE" },
                    StatusLine = { bg = "NONE" },
                    StatusLineNC = { bg = "NONE" },
                    CursorLineNr = { fg = "gold" },
                },
            })
        end,
    },
}
