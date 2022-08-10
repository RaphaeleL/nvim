local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function()
	use({ "wbthomason/packer.nvim" })

	-- Basic Plugins
	use({ "mbbill/undotree" }) -- Undo History
	use({ "terrortylor/nvim-comment" }) -- Comment Blocks
	use({ "windwp/nvim-autopairs" }) -- Auto Brackets
	use({ "lewis6991/impatient.nvim" }) -- Performance
	use({ "nvim-lua/plenary.nvim" }) -- Required by every second Plugin

	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	-- Colorscheme
	use({ "RaphaeleL/colorschemes" }) -- Scheme Collection

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" }) -- File Explorer
	use({ "nvim-telescope/telescope-file-browser.nvim" }) -- Telescope's Dired

	-- Snippets
	use({ "L3MON4D3/LuaSnip" }) -- Snippets)
	use({ "rafamadriz/friendly-snippets" }) -- Snippets)
	use({ "saadparwaiz1/cmp_luasnip" }) -- Snippets

	-- UI
	use({ "nvim-treesitter/nvim-treesitter" }) -- Syntax Highlighting
	use({ "kyazdani42/nvim-web-devicons" }) -- Icons
	use({ "lukas-reineke/indent-blankline.nvim" }) -- Indent Highlighting
	use({ "akinsho/toggleterm.nvim" }) -- Floating Terminal
	use({ "folke/which-key.nvim" }) -- Shortcut Menu
	use({ "romgrk/barbar.nvim" }) -- Tab Bar
	use({ "kyazdani42/nvim-tree.lua" }) -- File Explorer
	use({ "nvim-lualine/lualine.nvim" }) -- Menu Bar
	use({ "rcarriga/nvim-notify" }) -- Notifications
	use({ "RRethy/vim-illuminate" }) -- Highlight same words

	-- LSP
	use({ "onsails/lspkind.nvim" }) -- Pictograms
	use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" }) -- Lsp Installer / Config
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- Diagnostics / Code Actions / ...
	use({ "tamago324/nlsp-settings.nvim" }) -- Lsp Config with Json

	-- Auto Completion
	use({ "hrsh7th/nvim-cmp" }) -- Auto Completion
	use({ "hrsh7th/cmp-buffer" }) -- Auto Completion for Buffered words
	use({ "hrsh7th/cmp-path" }) -- Auto Completion for Paths
	use({ "hrsh7th/cmp-cmdline" }) -- Auto Completion for Commands
	use({ "hrsh7th/cmp-nvim-lsp" }) -- Auto Completion for Lsp Stuff
	use({ "tzachar/cmp-tabnine", run = "./install.sh" }) -- AI Completion

	-- Nice but not necessarily
	use({ "goolord/alpha-nvim" }) -- Dashboard
	use({ "nacro90/numb.nvim" }) -- Jump Around
	use({ "is0n/jaq-nvim" }) -- Run Code

	-- Graveyard
	-- use({ "SmiteshP/nvim-gps" }) -- Lualine Components
	-- use({ "simrat39/symbols-outline.nvim" }) -- Outliner
	-- use({ "f-person/git-blame.nvim" }) -- Git inline Informations
	-- use({ "tpope/vim-sensible" }) -- Line Informations
	-- use({ "glepnir/lspsaga.nvim" }) -- Collection of Helpfull Lsp Stuff
	-- use({ "ray-x/lsp_signature.nvim" }) -- Information about e.g. Methods
	-- use({ "p00f/nvim-ts-rainbow" }) -- Coloring Brackets
	-- use({ "folke/tokyonight.nvim" }) -- Colorscheme
	-- use({ "tjdevries/colorbuddy.vim" } -- Colorscheme
	-- use({ "olimorris/onedarkpro.nvim" } -- Colorscheme
	-- use({ "Lunarvim/colorschemes" } -- Colorscheme
	-- use({ "lunarvim/darkplus.nvim" } -- Colorscheme
	-- use({ "tiagovla/tokyodark.nvim" } -- Colorscheme
	-- use({ "shaeinst/roshnivim-cs" }) -- Scheme Collection

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require("packer").sync()
	end
end)
