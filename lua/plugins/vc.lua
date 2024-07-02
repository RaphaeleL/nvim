return {
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		keys = require("keymaps.git.lazygit"),
	},
	{
		"tpope/vim-fugitive",
		lazy = true,
		keys = require("keymaps.git.fugitive"),
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = require("settings.gitsigns"),
		keys = require("keymaps.git.gitsigns"),
	},
}
