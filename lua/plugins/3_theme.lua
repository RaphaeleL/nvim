require("rose-pine").setup({
    variant                          = "auto",
    dark_variant                     = "moon",
    dim_inactive_windows             = true,
    extend_background_behind_borders = true,
    dim_nc_background                = true,
    disable_background               = true,
    styles = {
        bold         = true,
        italic       = true,
        transparency = true,
    },
    groups = {},
    highlight_groups = {
        Normal          = { bg = "NONE" },
        NormalNC        = { bg = "NONE" },
        NormalFloat     = { bg = "NONE" },
        FloatBorder     = {},
        WinSeparator    = {},
        TelescopeNormal = {},
        Visual          = { bg = "#7f1d1d" },
        TelescopeBorder = { bg = "#181818", fg = "#181818" },
        StatusLine      = { bg = "NONE" },
        StatusLineNC    = { bg = "NONE" },
        CursorLineNr    = { fg = "gold" },
    },
})
vim.cmd("colorscheme rose-pine")

-- require("kanagawa").setup({
--     transparent = true,
--     overrides = function(colors)
--         return {
--             StatusLine             = { bg = "NONE" },
--             StatusLineNC           = { bg = "NONE" },
--             TabLineSel             = { bg = "NONE" },
--             LineNr                 = { bg = "NONE" },
--             CursorLineNr           = { bg = "NONE" },
--             SignColumn             = { bg = "NONE" },
--             GitSignsAdd            = { bg = "NONE" },
--             GitSignsChange         = { bg = "NONE" },
--             GitSignsDelete         = { bg = "NONE" },
--             DiagnosticSignError    = { bg = "NONE" },
--             DiagnosticSignWarn     = { bg = "NONE" },
--             DiagnosticSignInfo     = { bg = "NONE" },
--             DiagnosticSignHint     = { bg = "NONE" },
--             TelescopeBorder        = { bg = "NONE" },
--             TelescopeTitle         = { fg = colors.theme.ui.special, bold = true },
--             TelescopePromptNormal  = { bg = colors.theme.ui.bg_p1 },
--             TelescopePreviewNormal = { bg = colors.theme.ui.bg_dim },
--             Todo                   = { bg = colors.theme.ui.bg_p2 },
--             TelescopePromptBorder  = { fg = colors.theme.ui.bg_p1,  bg = colors.theme.ui.bg_p1 },
--             TelescopeResultsNormal = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m1 },
--             TelescopeResultsBorder = { fg = colors.theme.ui.bg_m1,  bg = colors.theme.ui.bg_m1 },
--             TelescopePreviewBorder = { bg = colors.theme.ui.bg_dim, fg = colors.theme.ui.bg_dim },
--             VisualNonText          = { fg = colors.theme.ui.bg_p3,  bg = "#223249" },
--         }
--     end,
--     background = {
--         -- dark = "dragon",
--         light = "lotus",
--     },
-- })
-- vim.cmd("colorscheme kanagawa")

-- require("catppuccin").setup({ transparent_background = true, })
-- vim.cmd.colorscheme "catppuccin"

-- vim.cmd("colorscheme default")

