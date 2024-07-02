return {
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		keys = require("plugins.keymaps.git.lazygit"),
	},
	{
		"tpope/vim-fugitive",
		lazy = true,
		keys = require("plugins.keymaps.git.fugitive"),
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = require("plugins.settings.gitsigns"),
		keys = require("plugins.keymaps.git.gitsigns"),
	},
}
