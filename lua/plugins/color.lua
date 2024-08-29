return {
	-- {
	-- 	"tjdevries/colorbuddy.nvim",
	-- 	lazy = true,
	-- 	priority = 1000,
	-- },
	-- {
	-- 	"Mofiqul/dracula.nvim",
	-- 	lazy = true,
	-- 	config = function()
	-- 		local dracula = require("dracula")
	-- 		---@diagnostic disable-next-line: missing-fields
	-- 		dracula.setup({
	-- 			transparent_bg = true,
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"HoNamDuong/hybrid.nvim",
	-- 	lazy = true,
	-- 	config = function()
	-- 		require("hybrid").setup({
	-- 			transparent = true,
	-- 		})
	-- 	end,
	-- },
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		config = function()
			require("kanagawa").setup({
				transparent = true,
				overrides = function(colors)
					return {
						StatusLine = { bg = "NONE" },
						StatusLineNC = { bg = "NONE" },
						TabLineSel = { bg = "NONE" },
						LineNr = { bg = "NONE" },
						CursorLineNr = { bg = "NONE" },
						SignColumn = { bg = "NONE" },
						GitSignsAdd = { bg = "NONE" },
						GitSignsChange = { bg = "NONE" },
						GitSignsDelete = { bg = "NONE" },
						DiagnosticSignError = { bg = "NONE" },
						DiagnosticSignWarn = { bg = "NONE" },
						DiagnosticSignInfo = { bg = "NONE" },
						DiagnosticSignHint = { bg = "NONE" },
						TelescopeBorder = { bg = "NONE" },
						TelescopeTitle = { fg = colors.theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = colors.theme.ui.bg_p1 },
						TelescopePromptBorder = { fg = colors.theme.ui.bg_p1, bg = colors.theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m1 },
						TelescopeResultsBorder = { fg = colors.theme.ui.bg_m1, bg = colors.theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = colors.theme.ui.bg_dim },
						TelescopePreviewBorder = { bg = colors.theme.ui.bg_dim, fg = colors.theme.ui.bg_dim },
						Todo = { bg = colors.theme.ui.bg_p2 },
						VisualNonText = { fg = colors.theme.ui.bg_p3, bg = "#223249" },
					}
				end,
				background = {
					dark = "dragon",
					light = "lotus",
				},
			})
		end,
	},
	-- {
	-- 	"rose-pine/neovim",
	-- 	lazy = true,
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			variant = "auto",
	-- 			dark_variant = "main",
	-- 			dim_nc_background = true,
	-- 			disable_background = true,
	-- 			styles = {
	-- 				bold = true,
	-- 				italic = true,
	-- 				transparency = true,
	-- 			},
	-- 			groups = {},
	-- 			highlight_groups = {
	-- 				StatusLine = { bg = "NONE" },
	-- 				StatusLineNC = { bg = "NONE" },
	-- 				CursorLineNr = { fg = "gold" },
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = true,
	-- 	name = "catppuccin",
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			highlight_overrides = {
	-- 				all = function(colors)
	-- 					return {
	-- 						NvimTreeNormal = { fg = colors.none },
	-- 						CmpBorder = { fg = "#3e4145" },
	-- 					}
	-- 				end,
	-- 			},
	-- 			background = {
	-- 				light = "latte",
	-- 				dark = "mocha",
	-- 			},
	-- 			show_end_of_buffer = false,
	-- 			transparent_background = true,
	-- 			integrations = {
	-- 				illuminate = true,
	-- 				cmp = true,
	-- 				gitsigns = true,
	-- 				nvimtree = true,
	-- 				treesitter = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	lazy = true,
	-- 	config = function()
	-- 		require("gruvbox").setup({
	-- 			transparent_mode = true,
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = true,
	-- 	config = function()
	-- 		---@diagnostic disable-next-line: missing-fields
	-- 		require("tokyonight").setup({
	-- 			transparent = true,
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"rafi/neo-hybrid.vim",
	-- 	dependencies = {
	-- 		{ "xiyaowong/transparent.nvim", event = "VeryLazy" },
	-- 	},
	-- 	lazy = true,
	-- 	config = function()
	-- 		require("transparent").setup({})
	-- 		vim.g.transparent_enabled = true
	-- 		vim.cmd("colorscheme neohybrid")
	-- 	end,
	-- },
}
