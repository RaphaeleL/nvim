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
	-- 	keys = {
	-- 		{ "<Leader>ue", "<cmd>IBLToggle<CR>", desc = "Toggle indent-lines" },
	-- 	},
	-- 	config = function()
	-- 		if vim.fn.has("nvim-0.10.0") == 0 then
	-- 			local utils = require("ibl.utils")
	-- 			---@diagnostic disable-next-line: deprecated
	-- 			utils.tbl_join = vim.tbl_flatten
	-- 		end
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
