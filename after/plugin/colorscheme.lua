require("catppuccin").setup({
	transparent_background = true,
	integrations = {
		aerial = false,
		barbar = false,
		beacon = false,
		cmp = true,
		coc_nvim = false,
		dashboard = true,
		fern = false,
		fidget = true,
		gitgutter = false,
		gitsigns = true,
		hop = false,
		illuminate = true,
		leap = false,
		lightspeed = false,
		lsp_saga = false,
		lsp_trouble = false,
		markdown = true,
		mini = false,
		neogit = false,
		neotest = false,
		neotree = false,
		notify = true,
		nvimtree = true,
		overseer = false,
		pounce = false,
		symbols_outline = true,
		telekasten = false,
		telescope = true,
		treesitter = true,
		treesitter_context = false,
		ts_rainbow = false,
		vim_sneak = false,
		vimwiki = false,
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		navic = {
			enabled = false,
			custom_bg = "NONE",
		},
	},
})

require('kanagawa').setup({
    transparent = true,
})

vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme catppuccin")

