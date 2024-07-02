if vim.fn.has("nvim-0.10.0") == 0 then
	local utils = require("ibl.utils")
	---@diagnostic disable-next-line: deprecated
	utils.tbl_join = vim.tbl_flatten
end

require("ibl").setup({
	indent = {
		char = "│",
		tab_char = "│",
	},
	scope = { enabled = false },
	exclude = {
		filetypes = {
			"alpha",
			"checkhealth",
			"dashboard",
			"git",
			"gitcommit",
			"help",
			"lazy",
			"lazyterm",
			"lspinfo",
			"man",
			"mason",
			"neo-tree",
			"notify",
			"Outline",
			"TelescopePrompt",
			"TelescopeResults",
			"terminal",
			"toggleterm",
			"Trouble",
		},
	},
})
