vim.opt.laststatus = 2
vim.opt.cmdheight = 1
vim.opt.showcmd = true
require("el").setup({})
vim.defer_fn(function()
	-- NOTE: This is not working in certain filetypes, e.g. Python.
	vim.cmd([[hi StatusLine guibg=None]])
	vim.cmd([[hi StatusLineNC guibg=None]])
end, 100)
