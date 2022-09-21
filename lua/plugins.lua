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
	use({ "lewis6991/impatient.nvim" }) -- Better Performance
	use({ "is0n/jaq-nvim" }) -- Run Code
	use({ "nvim-lua/plenary.nvim" }) -- some Lua Functions
	use({ "ThePrimeagen/harpoon" }) -- the one and only

	-- Keybinds
	use({ "folke/which-key.nvim" }) -- Shortcut Menu

	-- Git
	use({ "lewis6991/gitsigns.nvim" }) -- Gitsigns beside Numbers
	use({ "kdheepak/lazygit.nvim" }) -- Git Commands in Nvim

	-- Colorscheme
	use({ "rebelot/kanagawa.nvim" }) -- Colorscheme

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" }) -- File Explorer

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" }) -- Syntax Highlighting

	-- Snippets
	use({ "L3MON4D3/LuaSnip" }) -- Snippet Engine
	use({ "rafamadriz/friendly-snippets" }) -- Snippets

	-- UI
	use({ "kyazdani42/nvim-web-devicons" }) -- Icons
	use({ "nvim-lualine/lualine.nvim" }) -- Menu Bar
	use({ "RRethy/vim-illuminate" }) -- Highlight same words
	use({ "kyazdani42/nvim-tree.lua" }) -- File Explorer

	-- LSP
	use({ "williamboman/nvim-lsp-installer" }) -- Lsp Installer
	use({ "neovim/nvim-lspconfig" }) -- Lsp Config
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- Diagnostics / Code Actions
	use({ "tamago324/nlsp-settings.nvim" }) -- Lsp Config with Json

	-- Auto Completion
	use({ "hrsh7th/nvim-cmp" }) -- Auto Completion Engine
	use({ "hrsh7th/cmp-buffer" }) -- Auto Completion for Buffered words
	use({ "hrsh7th/cmp-path" }) -- Auto Completion for Paths
	use({ "hrsh7th/cmp-cmdline" }) -- Auto Completion for Commands
	use({ "hrsh7th/cmp-nvim-lsp" }) -- Auto Completion for Lsp Stuff

	-- Waiting for Nvim 0.8
	-- use({ "lvimuser/lsp-inlayhints.nvim" }) -- Lsp Inline Informations
	-- use({ "fgheng/winbar.nvim" }) -- Shows File, Function, ...

	-- Graveyard
	-- use({ "lukas-reineke/indent-blankline.nvim" }) -- Indent Highlighting
	-- use({ "goolord/alpha-nvim" }) -- Dashboard
	-- use({ "rcarriga/nvim-notify" }) -- Notifications
	-- use({ "romgrk/barbar.nvim" }) -- Tab Bar
	-- use({ "nvim-treesitter/nvim-treesitter-context" }) -- Sticky Methods
	-- use({ "nvim-telescope/telescope-file-browser.nvim" }) -- Dired like Filebrowser
	-- use({ "tzachar/cmp-tabnine" }) -- AI Completion
	-- use({ "akinsho/toggleterm.nvim" }) -- Floating Terminal
	-- use({ "SmiteshP/nvim-gps" }) -- Lualine Components
	-- use({ "simrat39/symbols-outline.nvim" }) -- Outliner
	-- use({ "f-person/git-blame.nvim" }) -- Git inline Informations
	-- use({ "tpope/vim-sensible" }) -- Line Informations
	-- use({ "glepnir/lspsaga.nvim" }) -- Collection of Helpfull Lsp Stuff
	-- use({ "ray-x/lsp_signature.nvim" }) -- Information about e.g. Methods
	-- use({ "saadparwaiz1/cmp_luasnip" }) -- Snippets
	-- use({ "p00f/nvim-ts-rainbow" }) -- Coloring Brackets
	-- use({ "tjdevries/colorbuddy.vim" } -- Colorscheme Creation
	-- use({ "folke/tokyonight.nvim" }) -- Colorscheme
	-- use({ "olimorris/onedarkpro.nvim" }) -- Colorscheme
	-- use({ "RaphaeleL/darkplus" }) -- Colorscheme
	-- use({ "jacoborus/tender.vim" }) -- Colorscheme
	-- use({ "tiagovla/tokyodark.nvim" }) -- Colorscheme
	-- use({ "Lunarvim/colorschemes" }) -- Scheme Collection
	-- use({ "shaeinst/roshnivim-cs" }) -- Scheme Collection
	-- use({ "nacro90/numb.nvim" }) -- Jump Around
	-- use({ "onsails/lspkind.nvim" }) -- Pictograms
	-- use({ "nvim-treesitter/nvim-treesitter-textobjects" }) -- Text Handlings
	-- use({ "iamcco/markdown-preview.nvim" }) -- Markdown Previewer
	-- use({ "sunjon/shade.nvim" }) -- Shade inactive Panes
	-- use({ "nvim-telescope/telescope-media-files.nvim" }) -- Show Pictures

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require("packer").sync()
	end
end)
