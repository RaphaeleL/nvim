-- local function make_transparent()
--   local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg
--   for name, hl in pairs(vim.api.nvim_get_hl(0, {})) do
--     if not hl.link and (hl.bg == normal_bg or name:match("^Normal") or name:match("Float")
--         or name:match("SignColumn") or name:match("LineNr") or name:match("StatusLine")
--         or name:match("Telescope") or name:match("^GitSigns") or name:match("^DiagnosticSign")) then
--       hl.bg, hl.ctermbg = nil, nil
--       vim.api.nvim_set_hl(0, name, hl)
--     end
--   end
-- end
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "gruber-darker",
--   callback = make_transparent,
-- })
-- vim.cmd.colorscheme("gruber-darker")

-- require("rose-pine").setup({
--     variant                          = "auto",
--     dark_variant                     = "moon",
--     dim_inactive_windows             = true,
--     extend_background_behind_borders = true,
--     dim_nc_background                = true,
--     disable_background               = true,
--     styles = {
--         bold         = true,
--         italic       = true,
--         transparency = true,
--     },
--     groups = {},
--     highlight_groups = {
--         Normal          = { bg = "NONE" },
--         NormalNC        = { bg = "NONE" },
--         NormalFloat     = { bg = "NONE" },
--         FloatBorder     = {},
--         WinSeparator    = {},
--         TelescopeNormal = {},
--         Visual          = { bg = "#7f1d1d" },
--         TelescopeBorder = { bg = "#181818", fg = "#181818" },
--         StatusLine      = { bg = "NONE" },
--         StatusLineNC    = { bg = "NONE" },
--         CursorLineNr    = { fg = "gold" },
--     },
-- })
-- vim.cmd("colorscheme rose-pine")

require("kanagawa").setup({
    transparent = true,
    overrides = function(colors)
        return {
            StatusLine             = { bg = "NONE" },
            StatusLineNC           = { bg = "NONE" },
            TabLineSel             = { bg = "NONE" },
            LineNr                 = { bg = "NONE" },
            CursorLine             = { bg = "NONE" },
            CursorLineNr           = { bg = "NONE" },
            SignColumn             = { bg = "NONE" },
            GitSignsAdd            = { bg = "NONE" },
            GitSignsChange         = { bg = "NONE" },
            GitSignsDelete         = { bg = "NONE" },
            DiagnosticSignError    = { bg = "NONE" },
            DiagnosticSignWarn     = { bg = "NONE" },
            DiagnosticSignInfo     = { bg = "NONE" },
            DiagnosticSignHint     = { bg = "NONE" },
            TelescopeBorder        = { bg = "NONE" },
            TelescopeTitle         = { fg = colors.theme.ui.special, bold = true },
            TelescopePromptNormal  = { bg = colors.theme.ui.bg_p1 },
            TelescopePreviewNormal = { bg = colors.theme.ui.bg_dim },
            Todo                   = { bg = colors.theme.ui.bg_p2 },
            TelescopePromptBorder  = { fg = colors.theme.ui.bg_p1,  bg = "NONE" },
            TelescopeResultsNormal = { fg = colors.theme.ui.fg_dim, bg = "NONE" },
            TelescopeResultsBorder = { fg = colors.theme.ui.bg_m1,  bg = "NONE" },
            TelescopePreviewBorder = { fg = colors.theme.ui.bg_dim, bg = "NONE" },
            VisualNonText          = { fg = colors.theme.ui.bg_p3,  bg = "#223249" },
        }
    end,
    background = {
        dark = "dragon",
        light = "lotus",
    },
})
vim.cmd("colorscheme kanagawa")

-- require("catppuccin").setup({ transparent_background = true, })
-- vim.cmd.colorscheme "catppuccin"

-- vim.cmd("colorscheme default")

-- require("gruber-darker").setup({
--     bold = true,
--     invert = {
--         signs = false,
--         tabline = false,
--         visual = false,
--     },
--     italic = {
--         strings = true,
--         comments = true,
--         operators = false,
--         folds = true,
--     },
--     undercurl = not true,
--     underline = not true,
-- })
-- vim.cmd.colorscheme("gruber-darker")
