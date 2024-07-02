return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("settings.treesitter")
		end,
	},
	{
		"mcauley-penney/visual-whitespace.nvim",
		event = "InsertEnter",
		opts = require("settings.visual_whitespace"),
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = "InsertEnter",
		opts = require("settings.highlight-colors"),
	},
	{
		"tjdevries/express_line.nvim",
		config = function()
			require("settings.statusline")
		end,
	},
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	main = "ibl",
	-- 	event = "VeryLazy",
	-- 	keys = require("keymaps.indent"),
	-- 	config = function()
	-- 		require("settings.indent")
	-- 	end,
	-- },
	-- {
	-- 	"RRethy/vim-illuminate",
	-- 	opts = {
	-- 		delay = 10,
	-- 		large_file_cutoff = 2000,
	-- 		large_file_overrides = {
	-- 			providers = { "lsp" },
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("illuminate").configure(opts)
	-- 	end,
	-- },
}
