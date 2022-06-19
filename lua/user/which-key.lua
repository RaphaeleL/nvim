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
		border = "rounded",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 1, 1, 1, 1 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
	ignore_missing = true,
	hidden = { "<silent>", ":", ":", "<cr>", "call", "lua", "^:", "^ " },
	show_help = true,
	triggers = "auto",
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

menu.register({
	["<leader>v"] = { ":vsplit<cr>", "Vertical Split" },
	["<leader>h"] = { ":split<cr>", "Horizontal Split" },
	["<leader>r"] = { ":redo<cr>", "Redo" },
	["<leader>u"] = { ":undo<cr>", "Undo" },
	["<leader>U"] = { ":UndotreeToggle<cr>", "Undotree" },
	["<leader>e"] = { ":NvimTreeToggle<cr>", "Explorer" },
	["<leader>n"] = { ":noh<cr>", "No Highlighting" },
	["<leader>c"] = { ":bdelete<cr>", "Close Tab" },
	["<leader>;"] = { ":Alpha<cr>", "Dashboard" },
	["<leader>H"] = { ":lua require('telescope.builtin').help_tags()<cr>", "Help" },
	["<leader>a"] = { ":call append(line('.'), '')<cr>", "Add Line Below" },
	["<leader>b"] = { ":call append(line('.')-1, '')<cr>", "Add Line Above" },
	["<leader>s"] = { ":Telescope find_files<cr>", "Files" },
})

menu.register({
	["<Leader>"] = {
		f = {
			name = "+Search",
			c = { ":Telescope colorscheme<cr>", "Colorscheme" },
			f = { ":Telescope find_files<cr>", "Find File" },
			h = { ":Telescope help_tags<cr>", "Find Help" },
			m = { ":Telescope man_pages<cr>", "Man Pages" },
			r = { ":Telescope oldfiles<cr>", "Open Recent File" },
			R = { ":Telescope registers<cr>", "Registers" },
			t = { ":Telescope live_grep<cr>", "Text" },
			k = { ":Telescope keymaps<cr>", "Keymaps" },
			C = { ":Telescope commands<cr>", "Commands" },
			p = {
				":lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
				"Colorscheme with Preview",
			},
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
			l = { ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Show Line Diagnostic" },
			p = { ":lua vim.lsp.diagnostic.show_position_diagnostics()<cr>", "Show Position Diagnostic" },
			d = { ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Diagnostics Buffer" },
			w = { ":Telescope diagnostics<cr>", "Diagnostics Workspace" },
			f = { ":lua vim.lsp.buf.formatting()<cr>", "Format" },
			e = { ":LspInfo<cr>", "Info" },
			o = { ":LspInstallInfo<cr>", "Installer Info" },
			n = { ":lua vim.lsp.diagnostic.goto_next()<cr>", "Show next Diagnostic" },
			N = { ":lua vim.lsp.diagnostic.goto_prev()<cr>", "Show previous Diagnostic" },
			s = { ":Telescope lsp_document_symbols<cr>", "Symbols Document" },
			S = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Symbols Workspace" },
			P = { -- Lunarvim
				name = "Peek",
				d = { ":lua require('user.lsp.peek').Peek('definition')<cr>", "Definition" },
				t = { ":lua require('user.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
				i = { ":lua require('user.lsp.peek').Peek('implementation')<cr>", "Implementation" },
			},
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
		g = {
			name = "+Git",
			g = { ":Copilot panel<cr>", "Github Copilot Suggestions" },
			l = { ":Gitsigns toggle_signs<cr>", "Toggle Line" },
			n = { ":Gitsigns toggle_numhl<cr>", "Toggle Num" },
			s = { ":Telescope git_status<cr>", "Status" },
			c = { ":Telescope git_commits<cr>", "Commits" },
			b = { ":Telescope git_branches<cr>", "Branches" },
			d = { ":Gitsigns diffthis HEAD<cr>", "Diff" },
			a = { ":Gitsigns blame_line<cr>", "Blame" },
		},
	},
})
