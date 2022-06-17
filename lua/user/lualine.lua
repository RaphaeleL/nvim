local gps = require("nvim-gps")

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "onedark",
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { { "mode", fmt = function() return " " end } },
    lualine_b = {"filename"},
    lualine_c = { {gps.get_location, cond = gps.is_available} },
    lualine_x = {"filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
