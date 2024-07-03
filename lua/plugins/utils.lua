return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"isak102/telescope-git-file-history.nvim",
		},
		lazy = true,
		keys = require("plugins.keymaps.telescope"),
		opts = require("plugins.settings.telescope"),
	},
	{
		"terrortylor/nvim-comment",
		event = "VeryLazy",
		config = function()
			require("nvim_comment").setup()
		end,
		keys = {
			{ "<Leader>l", ":CommentToggle<cr>" },
		},
	},
	{
		"nvim-pack/nvim-spectre",
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
		keys = require("plugins.keymaps.spectre"),
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = require("plugins.keymaps.trouble"),
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		config = function()
			require("plugins.settings.harpoon")
		end,
	},
	{
		"mbbill/undotree",
		lazy = true,
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "[U]ndotree" },
		},
	},
	{
		"NStefan002/visual-surround.nvim",
		event = "InsertEnter",
		config = true,
	},
	{
		"stevearc/oil.nvim",
		opts = require("plugins.settings.oil"),
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		keys = require("plugins.keymaps.nvim-tree"),
		opts = require("plugins.settings.nvim-tree"),
	},
}
