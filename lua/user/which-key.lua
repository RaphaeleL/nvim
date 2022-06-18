local menu = require("which-key")

menu.setup({
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
		presets = {
			operators = false,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	key_labels = {
		["<space>"] = "SPC",
		["<cr>"] = "RET",
		["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
	popup_mappings = {
		scroll_down = "<c-d>",
		scroll_up = "<c-u>",
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left", -- left, center or right
	},
	ignore_missing = true,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
	show_help = true,
	triggers = "auto",
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

menu.register({
	["<leader>r"] = { ":redo<cr>", "Redo" },
	["<leader>u"] = { ":undo<cr>", "Undo" },
	["<leader>U"] = { ":UndotreeToggle<cr>", "Undotree" },
	["<leader>e"] = { ":NvimTreeToggle<cr>", "Explorer" },
	["<leader>s"] = { ":Telescope find_files<cr>", "Filesystem" },
	["<leader>n"] = { ":noh<cr>", "No Highlighting" },
	["<leader>c"] = { ":bdelete<cr>", "Close Tab" },
	["<leader>;"] = { ":Alpha<cr>", "Dashboard" },
	["<leader>h"] = { ":lua require('telescope.builtin').help_tags()<cr>", "Help" },
})

menu.register({
	["<Leader>"] = {
		f = {
			name = "+File",
			g = {
				":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<cr>",
				"Grep Word",
			},
			b = { ":lua require('telescope.builtin').buffers()<cr>", "Show Buffers" },
			w = { ":Autoformat<cr>", "Format File" },
			l = { ":AutoformatLine<cr>", "Format Line" },
			f = { ":RemoveTrailingSpaces<cr>", "Remove Trailing Spaces" },
		},
	},
})

menu.register({
	["<Leader>"] = {
		d = {
			name = "+Diagnostics",
			D = { ":lua vim.lsp.buf.definition()<cr>", "Show Definition" },
			i = { ":lua vim.lsp.buf.implementation()<cr>", "Show Implementation" },
			r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
			I = { ":lua vim.lsp.buf.hover()<cr>", "Show Informations" },
			n = { ":lua vim.lsp.diagnostic.goto_next()<cr>", "Show next Diagnostic" },
			N = { ":lua vim.lsp.diagnostic.goto_prev()<cr>", "Show previous Diagnostic" },
			l = { ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Show Line Diagnostic" },
			p = { ":lua vim.lsp.diagnostic.show_position_diagnostics()<cr>", "Show Position Diagnostic" },
		},
	},
})

menu.register({
	["<Leader>"] = {
		t = {
			name = "+Terminal",
			t = { ":ToggleTerm direction=float<cr>", "Floating Terminal" },
			b = { ":ToggleTerm<cr>", "Terminal on the bottom" },
		},
	},
})

menu.register({
	["<Leader>"] = {
		a = {
			name = "+Lines",
			b = { ":call append(line('.'), '')<cr>", "Add Line Below" },
			a = { ":call append(line('.')-1, '')<cr>", "Add Line Above" },
		},
	},
})

menu.register({
	["<Leader>"] = {
		g = {
			name = "+Git",
			g = { ":Copilot panel<cr>", "Github Copilot Suggestions" },
			l = { ":Gitsigns toggle_signs<cr>", "Toggle Git Changes Sign" },
			s = { ":Telescope git_status<cr>", "Git Status" },
			c = { ":Telescope git_commits<cr>", "Git Commits" },
			b = { ":Telescope git_branches<cr>", "Git Branches" },
		},
	},
})
