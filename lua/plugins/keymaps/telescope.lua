return {
	{
		"<leader>sf",
		":Telescope find_files<cr>",
		desc = " Telescope: [S]how [F]uzzy File Finder",
	},
	{
		"<leader>sl",
		":Telescope live_grep<cr>",
		desc = " Telescope: [S]how [L]ive Grep",
	},
	{
		"<leader>sg",
		":Telescope git_files<cr>",
		desc = " Telescope: [S]how [G]it Files",
	},
	{
		"<leader>sd",
		":Telescope diagnostics<cr>",
		desc = " Telescope: [S]how [D]iagnostics",
	},

	{
		"<leader>sb",
		":Telescope buffers<cr>",
		desc = " Telescope: [S]how Buffers",
	},
	{
		"<leader>sk",
		":Telescope keymaps<cr>",
		desc = " Telescope: [S]how [K]eymaps",
	},

	{
		"<leader>sh",
		":lua require('telescope').extensions.git_file_history.git_file_history()<cr>",
		desc = " Telescope: [S]how Git [H]istory of File",
	},
}
