require("colorbuddy").colorscheme("gruvbuddy")

local colorbuddy = require("colorbuddy")
local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

Color.new("white", "#f2e5bc")
Color.new("red", "#cc6666")
Color.new("green", "#99cc99")
Color.new("yellow", "#f8fe7a")
Color.new("blue", "#81a2be")
Color.new("aqua", "#8ec07c")
Color.new("cyan", "#8abeb7")
Color.new("purple", "#8e6fbd")
Color.new("violet", "#b294bb")
Color.new("orange", "#de935f")
Color.new("brown", "#a3685a")
Color.new("seagreen", "#698b69")
Color.new("turquoise", "#698b69")

local background_string = "#1e1e1e"
Color.new("background", background_string)
Color.new("gray0", background_string)

Group.new("Normal", c.superwhite, c.gray0)

Group.new("@constant", c.orange, nil, s.none)
Group.new("@function", c.yellow, nil, s.none)
Group.new("@function.bracket", g.Normal, g.Normal)
Group.new("@keyword", c.violet, nil, s.none)
Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.none)
Group.new("@property", c.blue)
Group.new("@variable", c.superwhite, nil)
Group.new("@variable.builtin", c.purple:light():light(), g.Normal)
Group.new("@function.call.lua", c.blue:dark(), nil, nil)

Group.new("LineNr", c.gray2, nil, s.none)
Group.new("CursorLineNr", c.orange, nil, s.bold)

Group.new("IblIndent", c.gray2, nil, s.none)
Group.new("IblScope", c.gray2, nil, s.none)

Group.new("IlluminatedWordText", nil, c.gray2, s.none)
Group.new("IlluminatedWordRead", nil, c.gray2, s.none)
Group.new("IlluminatedWordWrite", nil, c.gray2, s.none)

-- vim.cmd("colorscheme dracula")
-- vim.cmd("colorscheme hybrid")
-- vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme neohybrid")
