local config = require("config")

if config.theme == "rose-pine" then
    vim.pack.add({ "https://github.com/rose-pine/neovim" }, { confirm = false })
    require("rose-pine").setup({
        variant = (config.transparent and "auto" or "moon"),
        dark_variant = "moon",
        dim_inactive_windows = true,
        extend_background_behind_borders = true,
        dim_nc_background = true,
        disable_background = config.transparent,
        styles = { bold = true,
            italic = true,
            transparency = config.transparent,
        },
        groups = {},
        highlight_groups = {
            Normal = (not config.transparent and { bg = "#181818" } or { bg = "NONE" }),
            NormalNC = (not config.transparent and { bg = "#181818" } or { bg = "NONE" }),
            NormalFloat = (not config.transparent and { bg = "#181818" } or { bg = "NONE" }),
            FloatBorder = (not config.transparent and { bg = "#181818" } or {}),
            WinSeparator = (not config.transparent and { bg = "#181818" } or {}),
            TelescopeNormal = (not config.transparent and { bg = "#181818" } or {}),
            TelescopeBorder = (not config.transparent and { bg = "#181818", fg = "#181818" } or {}),
            StatusLine = { bg = "NONE" },
            StatusLineNC = { bg = "NONE" },
            CursorLineNr = { fg = "gold" },
        },
    })
    vim.cmd("colorscheme rose-pine")
elseif config.theme == "kanagawa" then
    vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" }, { confirm = false })
    require("kanagawa").setup({
        transparent = true,
        overrides = function(colors)
            return {
                StatusLine = { bg = "NONE" },
                StatusLineNC = { bg = "NONE" },
                TabLineSel = { bg = "NONE" },
                LineNr = { bg = "NONE" },
                CursorLineNr = { bg = "NONE" },
                SignColumn = { bg = "NONE" },
                GitSignsAdd = { bg = "NONE" },
                GitSignsChange = { bg = "NONE" },
                GitSignsDelete = { bg = "NONE" },
                DiagnosticSignError = { bg = "NONE" },
                DiagnosticSignWarn = { bg = "NONE" },
                DiagnosticSignInfo = { bg = "NONE" },
                DiagnosticSignHint = { bg = "NONE" },
                TelescopeBorder = { bg = "NONE" },
                TelescopeTitle = { fg = colors.theme.ui.special, bold = true },
                TelescopePromptNormal = { bg = colors.theme.ui.bg_p1 },
                TelescopePromptBorder = { fg = colors.theme.ui.bg_p1, bg = colors.theme.ui.bg_p1 },
                TelescopeResultsNormal = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m1 },
                TelescopeResultsBorder = { fg = colors.theme.ui.bg_m1, bg = colors.theme.ui.bg_m1 },
                TelescopePreviewNormal = { bg = colors.theme.ui.bg_dim },
                TelescopePreviewBorder = { bg = colors.theme.ui.bg_dim, fg = colors.theme.ui.bg_dim },
                Todo = { bg = colors.theme.ui.bg_p2 },
                VisualNonText = { fg = colors.theme.ui.bg_p3, bg = "#223249" },
            }
        end,
        background = {
            -- dark = "dragon",
            light = "lotus",
        },
    })
    vim.cmd("colorscheme kanagawa")
elseif config.theme == "catppuccin" then
    vim.pack.add({ "https://github.com/catppuccin/nvim"}, { confirm = false })
    require("catppuccin").setup({ transparent_background = true, })
    vim.cmd.colorscheme "catppuccin"
else
    vim.cmd("colorscheme default")
end
