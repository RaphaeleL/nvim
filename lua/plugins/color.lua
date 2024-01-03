return {
    {
		"rebelot/kanagawa.nvim",
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
					}
				end,
				background = {
					dark = "dragon",
					light = "lotus"
				}
			})
			vim.cmd("colorscheme kanagawa")
		end
	},
}
