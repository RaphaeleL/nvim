require("neoscroll").setup({
	mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
	hide_cursor = true,
	stop_eof = true,
	use_local_scrolloff = false,
	respect_scrolloff = true,
	cursor_scrolls_alone = false,
})

local t = {}
t["<c-k>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
t["<c-j>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }

require("neoscroll.config").set_mappings(t)
