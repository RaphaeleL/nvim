return {
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
            vim.cmd("colorscheme rose-pine")
        end,
    },
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
    --         vim.cmd("colorscheme kanagawa")
    --     end,
    -- },
    -- {
    --     "tjdevries/colorbuddy.nvim",
    --     lazy = true,
    --     priority = 1000,
    --     config = function()
    --         -- Dark
    --         require("colorbuddy").colorscheme("gruvbuddy")
    --         local colorbuddy = require("colorbuddy")
    --         local Color = colorbuddy.Color
    --         local Group = colorbuddy.Group
    --         local c = colorbuddy.colors
    --         local g = colorbuddy.groups
    --         local s = colorbuddy.styles
    --         Color.new("white", "#f2e5bc")
    --         Color.new("red", "#cc6666")
    --         Color.new("green", "#99cc99")
    --         Color.new("yellow", "#f8fe7a")
    --         Color.new("blue", "#81a2be")
    --         Color.new("aqua", "#8ec07c")
    --         Color.new("cyan", "#8abeb7")
    --         Color.new("purple", "#8e6fbd")
    --         Color.new("violet", "#b294bb")
    --         Color.new("orange", "#de935f")
    --         Color.new("brown", "#a3685a")
    --         Color.new("seagreen", "#698b69")
    --         Color.new("turquoise", "#698b69")
    --         local background_string = "#1e1e1e"
    --         Color.new("background", background_string)
    --         Color.new("gray0", background_string)
    --         Group.new("Normal", c.superwhite, c.gray0)
    --         Group.new("@constant", c.orange, nil, s.none)
    --         Group.new("@function", c.yellow, nil, s.none)
    --         Group.new("@function.bracket", g.Normal, g.Normal)
    --         Group.new("@keyword", c.violet, nil, s.none)
    --         Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.none)
    --         Group.new("@property", c.blue)
    --         Group.new("@variable", c.superwhite, nil)
    --         Group.new("@variable.builtin", c.purple:light():light(), g.Normal)
    --         Group.new("@function.call.lua", c.blue:dark(), nil, nil)
    --         Group.new("LineNr", c.gray2, nil, s.none)
    --         Group.new("CursorLineNr", c.orange, nil, s.bold)
    --         Group.new("IblIndent", c.gray2, nil, s.none)
    --         Group.new("IblScope", c.gray2, nil, s.none)
    --         Group.new("IlluminatedWordText", nil, c.gray2, s.none)
    --         Group.new("IlluminatedWordRead", nil, c.gray2, s.none)
    --         Group.new("IlluminatedWordWrite", nil, c.gray2, s.none)
    --         Group.new("StatusLine", nil, nil, s.none)
    --
    --         -- Light
    --         require("colorbuddy").colorscheme("gruvbuddy")
    --         local colorbuddy = require("colorbuddy")
    --         local Color = colorbuddy.Color
    --         local Group = colorbuddy.Group
    --         local c = colorbuddy.colors
    --         local g = colorbuddy.groups
    --         local s = colorbuddy.styles
    --         Color.new("white", "#f2e5bc")
    --         Color.new("black", "#181818")
    --         Color.new("red", "#cc6666")
    --         Color.new("green", "#678E58")
    --         Color.new("yellow", "#979B40")
    --         Color.new("blue", "#81a2be")
    --         Color.new("aqua", "#8ec07c")
    --         Color.new("cyan", "#4C7771")
    --         Color.new("purple", "#5B4281")
    --         Color.new("violet", "#7C5489")
    --         Color.new("orange", "#de935f")
    --         Color.new("brown", "#a3685a")
    --         Color.new("seagreen", "#698b69")
    --         Color.new("turquoise", "#698b69")
    --         local background_string = "#f6f5f4"
    --         Color.new("background", background_string)
    --         Color.new("gray0", background_string)
    --         Group.new("Normal", c.black, c.gray0)
    --         Group.new("@constant", c.orange, nil, s.none)
    --         Group.new("@function", c.yellow, nil, s.none)
    --         Group.new("@function.bracket", c.black, nil, s.none)
    --         Group.new("@keyword", c.violet, nil, s.none)
    --         Group.new("@keyword.faded", c.black, nil, s.none)
    --         Group.new("@property", c.blue)
    --         Group.new("@variable", c.black, nil, s.none)
    --         Group.new("@variable.builtin", c.purple:light():light(), g.Normal)
    --         Group.new("@function.call.lua", c.blue:dark(), nil, nil)
    --         Group.new("LineNr", c.gray2, nil, s.none)
    --         Group.new("CursorLineNr", c.orange, nil, s.bold)
    --         Group.new("IblIndent", c.gray2, nil, s.none)
    --         Group.new("IblScope", c.gray2, nil, s.none)
    --         Group.new("IlluminatedWordText", nil, c.gray2, s.none)
    --         Group.new("IlluminatedWordRead", nil, c.gray2, s.none)
    --         Group.new("IlluminatedWordWrite", nil, c.gray2, s.none)
    --         Group.new("StatusLine", nil, nil, s.none)
    --     end
    -- },
}
