return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"isak102/telescope-git-file-history.nvim",
		},
		lazy = true,
		keys = require("keymaps.telescope"),
		opts = require("settings.telescope"),
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
		keys = require("keymaps.spectre"),
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = require("keymaps.trouble"),
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		keys = require("keymaps.comment_gen"),
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
			require("settings.harpoon")
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
		opts = require("settings.oil"),
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		keys = require("keymaps.nvim-tree"),
		opts = require("settings.nvim-tree"),
	},
}
