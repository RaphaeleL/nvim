vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 250
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.laststatus = 0
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17"
vim.opt.fillchars.eob = " "
vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.shell = "/bin/zsh"
vim.opt.relativenumber = true

vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
vim.cmd([[set formatoptions-=cro]])

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
		fidget = false,
		gitgutter = false,
		gitsigns = true,
		hop = false,
		illuminate = false,
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
		symbols_outline = false,
		telekasten = false,
		telescope = true,
		treesitter = true,
		treesitter_context = false,
		ts_rainbow = false,
		vim_sneak = false,
		vimwiki = false,
		which_key = false,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
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
vim.cmd("colorscheme catppuccin")
