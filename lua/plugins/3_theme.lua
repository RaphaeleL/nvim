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
            DiagnosticError             = { bg = "NONE" },
            DiagnosticWarn              = { bg = "NONE" },
            DiagnosticInfo              = { bg = "NONE" },
            DiagnosticHint              = { bg = "NONE" },
            DiagnosticOk                = { bg = "NONE" },
            DiagnosticVirtualTextError  = { bg = "NONE" },
            DiagnosticVirtualTextWarn   = { bg = "NONE" },
            DiagnosticVirtualTextInfo   = { bg = "NONE" },
            DiagnosticVirtualTextHint   = { bg = "NONE" },
            DiagnosticSignError         = { bg = "NONE" },
            DiagnosticSignWarn          = { bg = "NONE" },
            DiagnosticSignInfo          = { bg = "NONE" },
            DiagnosticSignHint          = { bg = "NONE" },
            CmpNormal                   = { bg = "NONE" },
            CmpBorder                   = { bg = "NONE" },
            CmpDocumentation            = { bg = "NONE" },
            CmpDocumentationBorder      = { bg = "NONE" },
            -- Pmenu                    = { bg = "NONE" },
            -- PmenuSbar                = { bg = "NONE" },
            Pmenu                       = { bg = "NONE" },
            PmenuSel                    = { bg = colors.theme.ui.bg_p2, fg     = colors.theme.ui.fg, bold = true },
            PmenuSbar                   = { bg = "NONE" },
            PmenuThumb                  = { bg = colors.theme.ui.bg_p2 },
            NormalFloat                 = { bg = "NONE" },
            FloatBorder                 = { bg = "NONE" },
            FloatTitle                  = { bg = "NONE" },
            FloatFooter                 = { bg = "NONE" },
            LspInfoBorder               = { bg = "NONE" },
            LspSignatureActiveParameter = { bg = "NONE" },
            NotifyBackground            = { bg = "NONE" },
            StatusLine                  = { bg = "NONE" },
            StatusLineNC                = { bg = "NONE" },
            TabLineSel                  = { bg = "NONE" },
            LineNr                      = { bg = "NONE" },
            -- CursorLine               = { bg = colors.theme.ui.bg_p1 },
            -- CursorLineNr             = { fg = colors.theme.ui.special, bold = true },
            CursorLine                  = { bg = "NONE" },
            CursorLineNr                = { bg = "NONE" },
            SignColumn                  = { bg = "NONE" },
            GitSignsAdd                 = { bg = "NONE" },
            GitSignsChange              = { bg = "NONE" },
            GitSignsDelete              = { bg = "NONE" },
            Todo                        = { bg = colors.theme.ui.bg_p2 },
            VisualNonText               = { fg = colors.theme.ui.bg_p3,  bg    = "#223249" },
            TelescopeNormal             = { bg = "NONE" },
            TelescopeBorder             = { bg = "NONE" },
            TelescopePromptNormal       = { bg = "NONE" },
            TelescopePromptBorder       = { fg = colors.theme.ui.bg_p1, bg     = "NONE" },
            TelescopeResultsNormal      = { fg = colors.theme.ui.fg_dim, bg    = "NONE" },
            TelescopeResultsBorder      = { fg = colors.theme.ui.bg_m1, bg     = "NONE" },
            TelescopePreviewNormal      = { bg = "NONE" },
            TelescopePreviewBorder      = { fg = colors.theme.ui.bg_dim, bg    = "NONE" },
            TelescopeTitle              = { fg = colors.theme.ui.special, bold = true },
            TelescopeSelection          = { bg = colors.theme.ui.bg_p2, fg     = colors.theme.ui.fg, bold = true },
            TelescopeSelectionCaret     = { fg = colors.theme.ui.special, bg   = colors.theme.ui.bg_p2 },
            -- TelescopeBorder          = { bg = "NONE" },
            -- TelescopeTitle           = { fg = colors.theme.ui.special, bold = true },
            -- TelescopePromptNormal    = { bg = colors.theme.ui.bg_p1 },
            -- TelescopePreviewNormal   = { bg = colors.theme.ui.bg_dim },
            -- TelescopePromptBorder    = { fg = colors.theme.ui.bg_p1,  bg    = "NONE" },
            -- TelescopeResultsNormal   = { fg = colors.theme.ui.fg_dim, bg    = "NONE" },
            -- TelescopeResultsBorder   = { fg = colors.theme.ui.bg_m1,  bg    = "NONE" },
            -- TelescopePreviewBorder   = { fg = colors.theme.ui.bg_dim, bg    = "NONE" },
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
