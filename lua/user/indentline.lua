local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	require("user.notify").message("Coult not load indent_blankline", "Loading Error", "error")
	return
end

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
	"help",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
}
vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = true
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true

vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("eol:¶")

indent_blankline.setup({
	show_current_context = true,
	show_end_of_line = true,
})
