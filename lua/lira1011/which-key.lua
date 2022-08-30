local status_ok, menu = pcall(require, "which-key")

if not status_ok then
	require("user.notify").message("Could not load which-key", "Loading Error", "error")
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
	["<leader>;"] = { ":Alpha<cr>", "Dashboard" },
})

menu.register({
	["<Leader>"] = {
		n = { ":noh<cr>", "No Highlighting" },
		f = { ":Telescope find_files<cr>", "Find files" },
		x = { ":Telescope file_browser<cr>", "File Browser" },
		e = { ":NvimTreeToggle<cr>", "File Explorer" },
		c = { ":bdelete<cr>", "Close" },
		u = { ":UndotreeToggle<cr>", "History" },
		r = { ":Jaq bang<cr>", "Run Code" },
		k = { ":CommentToggle<cr>", "Comment Line" },
	},
})

menu.register({
	["<Leader>"] = {
		b = {
			name = "+Buffer",
			b = { ":Telescope buffers<cr>", "Show buffers" },
			g = { ":BufferGoto<cr>", "Goto Tab" },
			n = { ":BufferNext<cr>", "Next" },
			p = { ":BufferPrevious<cr>", "Previous" },
			d = { ":BufferDelete<cr>", "Delete" },
			k = { ":BufferCloseallButCurrent<cr>", "Close all expect of the Current" },
			t = { ":BufferPick<cr>", "Pick" },
			c = { ":bdelete<cr>", "Close Window" },
			v = { ":vsplit<cr>", "Vertical Split" },
			h = { ":split<cr>", "Horizontal Split" },
		},
	},
})

menu.register({
	["<Leader>"] = {
		s = {
			name = "+Search",
			g = {
				":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<cr>",
				"Grep Word",
			},
			r = { ":Telescope oldfiles<cr>", "Open Recent File" },
			t = { ":Telescope live_grep<cr>", "Live Grep" },
		},
	},
})

-- menu.register({
-- 	["<Leader>"] = {
-- 		D = {
-- 			name = "+LspSaga (trying it out)",
-- 			d = { ":Lspsaga hover_doc<cr>", "Documentation" },
-- 			r = { ":Lspsaga rename<cr>", "Rename" },
-- 			f = { ":Lspsaga lsp_finder<cr>", "Finder" },
-- 			a = { ":Lspsaga code_action<cr>", "Code Action" },
-- 			p = { ":Lspsaga preview_defintion<cr>", "Preview Definition" },
-- 			l = { ":Lspsaga show_line_diagnostics<cr>", "Line Diagnostics" },
-- 			c = { ":Lspsaga show_cursor_diagnostics<cr>", "Cursor Diagnostics" },
-- 			h = { ":Lspsaga signature_help<cr>", "Signature Help" },
-- 		},
-- 	},
-- })

menu.register({
	["<Leader>"] = {
		d = {
			name = "+Diagnostics",
			r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
			l = { ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Line Diagnostic" },
			p = { ":lua vim.lsp.diagnostic.show_position_diagnostics()<cr>", "Position Diagnostic" },
			d = { ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Diagnostics Buffer" },
			w = { ":Telescope diagnostics<cr>", "Diagnostics Workspace" },
			f = { ":lua vim.lsp.buf.formatting()<cr>", "Format" },
			e = { ":LspInfo<cr>", "Info" },
			o = { ":LspInstallInfo<cr>", "Installer Info" },
			n = { ":lua vim.lsp.diagnostic.goto_next()<cr>", "Next Diagnostic" },
			N = { ":lua vim.lsp.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
			-- P = { -- Lunarvim
			-- 	name = "Peek",
			-- 	d = { ":lua require('user.lsp.peek').Peek('definition')<cr>", "Definition" },
			-- 	t = { ":lua require('user.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
			-- 	i = { ":lua require('user.lsp.peek').Peek('implementation')<cr>", "Implementation" },
			-- },
		},
	},
})

menu.register({
	["<Leader>"] = {
		a = {
			name = "+Actions",
			c = { ":lua vim.lsp.buf.declaration()<cr>", "Declaration" },
			a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Actions" },
			R = { ":lua vim.lsp.buf.references()<cr>", "References" },
			D = { ":lua vim.lsp.buf.definition()<cr>", "Definition" },
			h = { ":lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
			q = { ":lua vim.diagnostic.setloclist()<cr>", "Set Location List" },
			i = { ":lua vim.lsp.buf.implementation()<cr>", "Implementation" },
			I = { ":lua vim.lsp.buf.hover()<cr>", "Informations" },
			s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
			S = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Symbols Workspace" },
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
			l = { ":Gitsigns toggle_signs<cr>", "Toggle Line" },
			n = { ":Gitsigns toggle_numhl<cr>", "Toggle Num" },
		},
	},
})

menu.register({
	["<Leader>"] = {
		t = {
			name = "+Terminal",
			f = { ":ToggleTerm direction=float<cr>", "Floating Terminal" },
			b = { ":ToggleTerm direction=horizontal<cr>", "Bottom Terminal" },
		},
	},
})

menu.register({
	["<Leader>"] = {
		h = {
			name = "+Help",
			h = { ":lua require('telescope.builtin').help_tags()<cr>", "Configuration Help" },
			k = { ":Telescope keymaps<cr>", "Keymaps" },
			C = { ":Telescope commands<cr>", "Commands" },
			-- m = { ":Telescope man_pages<cr>", "Man Pages" },
		},
	},
})
