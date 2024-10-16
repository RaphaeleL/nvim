return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"lewis6991/impatient.nvim",
		event = "VeryLazy",
	},
	-- {
	-- 	"Zeioth/hot-reload.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- 	event = "BufEnter",
	-- 	opts = function()
	-- 		local config_dir = vim.fn.stdpath("config")
	-- 		local files = {
	-- 			config_dir .. "/init.lua",
	-- 			config_dir .. "/lua/plugins/ai.lua",
	-- 			config_dir .. "/lua/plugins/color.lua",
	-- 			config_dir .. "/lua/plugins/completion.lua",
	-- 			config_dir .. "/lua/plugins/init.lua",
	-- 			config_dir .. "/lua/plugins/lsp.lua",
	-- 			config_dir .. "/lua/plugins/ui.lua",
	-- 			config_dir .. "/lua/plugins/utils.lua",
	-- 			config_dir .. "/lua/plugins/vc.lua",
	-- 			config_dir .. "/plugin/autocommands.lua",
	-- 			config_dir .. "/plugin/color.lua",
	-- 			config_dir .. "/plugin/keymaps.lua",
	-- 			config_dir .. "/plugin/options.lua",
	-- 		}
	-- 		return {
	-- 			reload_files = files,
	-- 			notify = false,
	-- 			reload_callback = function()
	-- 				local plugin = "Hot Reloading"
	-- 				vim.notify = require("notify")
	-- 				vim.notify("Reloading Files ... \n - " .. vim.fn.expand("%:p"), "info", {
	-- 					title = plugin,
	-- 				})
	-- 			end,
	-- 		}
	-- 	end,
	-- },
}
