return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.settings.treesitter")
		end,
	},
	{
		"mcauley-penney/visual-whitespace.nvim",
		event = "InsertEnter",
		opts = require("plugins.settings.visual_whitespace"),
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = "InsertEnter",
		opts = require("plugins.settings.highlight-colors"),
	},
	{
		"tjdevries/express_line.nvim",
		config = function()
			require("plugins.settings.statusline")
		end,
	},
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	main = "ibl",
	-- 	event = "VeryLazy",
	-- 	keys = require("plugins.keymaps.indent"),
	-- 	config = function()
	-- 		require("plugins.settings.indent")
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
