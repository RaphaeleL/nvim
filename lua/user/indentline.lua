local indent_blankline = require("indent_blankline")

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
  "help",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Trouble",
  "text",
  "startify",
  "dashboard",
}

vim.g.indentLine_enabled =  1
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = true
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = false 
vim.g.indent_blankline_show_current_context = true

vim.opt.list = true
vim.opt.listchars:append("eol:¶")
-- vim.opt.listchars:append("eol:↴")

indent_blankline.setup({
  show_current_context = true,
  show_end_of_line = true,
})
