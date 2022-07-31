local status_ok, menu = pcall(require, "which-key")
if not status_ok then
	require("user.notify").message("Coult not load which-key", "Loading Error", "error")
	return
end

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
	["<Leader>"] = {
		a = { ":Alpha<cr>", "Dashboard" },
		n = { ":noh<cr>", "No Highlighting" },
		s = { ":Telescope find_files<cr>", "Find files" },
		c = { ":bdelete<cr>", "Close" },
		e = { ":NvimTreeToggle<cr>", "File Explorer" },
		u = { ":UndotreeToggle<cr>", "History" },
	},
})

menu.register({
	["<Leader>"] = {
		l = {
			name = "+Line",
			a = { ":call append(line('.'), '')<cr>", "Add Line Below" },
			b = { ":call append(line('.')-1, '')<cr>", "Add Line Above" },
			c = { ":CommentToggle<cr>", "Comment Line" },
		},
	},
})

-- menu.register({
-- 	["<Leader>"] = {
-- 		h = {
-- 			name = "+Harpoon",
-- 			t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Open Harpoon" },
-- 			m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark File" },
-- 			n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next" },
-- 			p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Previous" },
-- 			c = { ":lua require('harpoon.mark').clear_all()<cr>", "Clear Marks" },
-- 		},
-- 	},
-- })

menu.register({
	["<Leader>"] = {
		b = {
			name = "+Buffer",
			b = { ":Telescope buffers<cr>", "Show buffers" },
			g = { ":BufferGoto<cr>", "Goto Tab" },
			n = { ":BufferNext<cr>", "Next" },
			p = { ":BufferPrevious<cr>", "Previous" },
			d = { ":BufferDelete<cr>", "Delete" },
			c = { ":BufferCloseallButCurrent<cr>", "Close all expect of the Current" },
			t = { ":BufferPick<cr>", "Pick" },
		},
	},
})

menu.register({
	["<Leader>"] = {
		o = {
			name = "+Open",
			s = { ":Telescope find_files<cr>", "Find files" },
			o = { ":SymbolsOutline<cr>", "Outline" },
			e = { ":NvimTreeToggle<cr>", "File Explorer" },
			u = { ":UndotreeToggle<cr>", "History" },
			d = { ":Alpha<cr>", "Dashboard" },
			h = { ":lua require('telescope.builtin').help_tags()<cr>", "Help" },
			t = {
				f = { ":ToggleTerm direction=float<cr>", "Floating Terminal" },
				b = { ":ToggleTerm direction=horizontal<cr>", "Bottom Terminal" },
			},
		},
	},
})

menu.register({
	["<Leader>"] = {
		w = {
			name = "+Window",
			c = { ":bdelete<cr>", "Close Window" },
			v = { ":vsplit<cr>", "Vertical Split" },
			h = { ":split<cr>", "Horizontal Split" },
		},
	},
})

menu.register({
	["<Leader>"] = {
		f = {
			name = "+Search",
			g = {
				":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<cr>",
				"Grep Word",
			},
			c = { ":Telescope colorscheme<cr>", "Colorscheme" },
			f = { ":Telescope find_files<cr>", "Find File" },
			h = { ":Telescope help_tags<cr>", "Find Help" },
			m = { ":Telescope man_pages<cr>", "Man Pages" },
			r = { ":Telescope oldfiles<cr>", "Open Recent File" },
			R = { ":Telescope registers<cr>", "Registers" },
			t = { ":Telescope live_grep<cr>", "Text" },
			k = { ":Telescope keymaps<cr>", "Keymaps" },
			C = { ":Telescope commands<cr>", "Commands" },
		},
	},
})

menu.register({
	["<Leader>"] = {
		d = {
			name = "+Diagnostics",
			c = { ":lua vim.lsp.buf.declaration()<cr>", "Show Declaration" },
			a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Actions" },
			R = { ":lua vim.lsp.buf.references()<cr>", "Show References" },
			D = { ":lua vim.lsp.buf.definition()<cr>", "Show Definition" },
			h = { ":lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
			q = { ":lua vim.diagnostic.setloclist()<cr>", "Set Location List" },
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
			name = "+Toggle",
			l = { ":Gitsigns toggle_signs<cr>", "Toggle Line" },
			n = { ":Gitsigns toggle_numhl<cr>", "Toggle Num" },
		},
	},
})

menu.register({
	["<Leader>"] = {
		g = {
			name = "+Git",
			s = { ":Telescope git_status<cr>", "Status" },
			c = { ":Telescope git_commits<cr>", "Commits" },
			b = { ":Telescope git_branches<cr>", "Branches" },
			d = { ":Gitsigns diffthis HEAD<cr>", "Diff" },
			a = { ":Gitsigns blame_line<cr>", "Blame" },
		},
	},
})
