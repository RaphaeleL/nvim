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
	use({ "lewis6991/impatient.nvim" }) -- Coloring
	use({ "terrortylor/nvim-comment" }) -- Comment Blocks
	use({ "lukas-reineke/indent-blankline.nvim" }) -- Indent Highlighting
	use({ "windwp/nvim-autopairs" }) -- Auto Brackets
	use({ "kyazdani42/nvim-web-devicons" }) -- Icons
	use({ "nvim-lua/plenary.nvim" }) -- Required by every second Plugin

	-- UI
	use({ "akinsho/toggleterm.nvim" }) -- Floating Terminal
	use({ "folke/which-key.nvim" }) -- Shortcut Menu
	use({ "romgrk/barbar.nvim" }) -- Tab Bar 
	use({ "kyazdani42/nvim-tree.lua" }) -- File Explorer
	use({ "goolord/alpha-nvim" }) -- Dashboard
	use({ "SmiteshP/nvim-gps" }) -- Lualine Components
	use({ "nvim-lualine/lualine.nvim" }) -- Menu Bar 
	use({ "nacro90/numb.nvim" }) -- Jump Around
	use({ "rcarriga/nvim-notify" }) -- Notifications
	use({ "RRethy/vim-illuminate" }) -- Highlight same words

	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	-- LSP
	use({ "onsails/lspkind.nvim" }) -- Pictograms
	use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" }) -- Lsp Installer / Config
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- Diagnostics / Code Actions / ...
	use({ "tamago324/nlsp-settings.nvim" }) -- Lsp Config with Json
	use({ "ray-x/lsp_signature.nvim" }) -- Information about e.g. Methods
	-- use({ "glepnir/lspsaga.nvim " })

	-- Auto Completion
	use({ "hrsh7th/nvim-cmp" }) -- Auto Completion
	use({ "hrsh7th/cmp-buffer" }) -- .. for Buffered words
	use({ "hrsh7th/cmp-path" }) -- .. for Paths
	use({ "hrsh7th/cmp-cmdline" }) -- .. for Commands
	use({ "hrsh7th/cmp-nvim-lsp" }) -- .. for Lsp Stuff
	use({ "tpope/vim-sensible" }) -- .. Line Informations
	use({ "tzachar/cmp-tabnine", run = "./install.sh" }) -- AI Completion

	-- Colorscheme
	use({ "shaeinst/roshnivim-cs" }) -- Scheme Collection)
	use({ "christianchiarulli/nvcode-color-schemes.vim" }) -- Scheme Collection

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" }) -- Syntax Highlighting
	use({ "p00f/nvim-ts-rainbow" }) -- Coloring Brackets

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" }) -- File Explorer
	use({ "nvim-telescope/telescope-file-browser.nvim" }) -- Dired

	-- Snippets
	use({ "L3MON4D3/LuaSnip" }) -- Snippets)
	use({ "rafamadriz/friendly-snippets" }) -- Snippets)
	use({ "saadparwaiz1/cmp_luasnip" }) -- Snippets

	-- Quickrun
	use({ "is0n/jaq-nvim" }) -- Run Code

	-- Graveyard
	-- use({ "simrat39/symbols-outline.nvim" })
	-- use({ "f-person/git-blame.nvim" })
	-- use({ "folke/tokyonight.nvim" })
	-- use({ "tjdevries/colorbuddy.vim" })
	-- use({ "olimorris/onedarkpro.nvim" })
	-- use({ "Lunarvim/colorschemes" })
	-- use({ "lunarvim/darkplus.nvim" })
	-- use({ "tiagovla/tokyodark.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require("packer").sync()
	end
end)
