local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
print()
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
		plugins,
	})
end

return require("packer").startup(function()
	use({ "wbthomason/packer.nvim" })

	-- Basic Plugins
	use({ "mbbill/undotree" }) -- Undo History
	use({ "terrortylor/nvim-comment" }) -- Comment Blocks
	use({ "windwp/nvim-autopairs" }) -- Auto Brackets
	use({ "lewis6991/impatient.nvim" }) -- Better Performance
	use({ "nvim-lua/plenary.nvim" }) -- some Lua Functions

	-- Keybinds
	use({ "folke/which-key.nvim" }) -- Shortcut Menu

	-- Git
	use({ "lewis6991/gitsigns.nvim" }) -- Gitsigns beside Numbers
	use({ "kdheepak/lazygit.nvim" }) -- Git Commands in Nvim

	-- Colorscheme
	use({ "Mofiqul/vscode.nvim" }) -- Colorscheme

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" }) -- File Explorer

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" }) -- Syntax Highlighting

	-- Snippets
	use({ "L3MON4D3/LuaSnip" }) -- Snippet Engine
	use({ "rafamadriz/friendly-snippets" }) -- Snippets
	use({ "saadparwaiz1/cmp_luasnip" }) -- Snippets

	-- UI
	use({ "kyazdani42/nvim-web-devicons" }) -- Icons
	use({ "nvim-lualine/lualine.nvim" }) -- Menu Bar

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- Lsp Config
	use({ "williamboman/mason.nvim" }) -- Nvim Package Manager
	use({ "williamboman/mason-lspconfig.nvim" }) -- Mason Config
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- Diagnostics / Code Actions
	use({ "ray-x/lsp_signature.nvim" }) -- Show function signature
	use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" }) -- Lsp Line Diagnostics

	-- Auto Completion
	use({ "hrsh7th/nvim-cmp" }) -- Auto Completion Engine
	use({ "hrsh7th/cmp-buffer" }) -- Auto Completion for Buffered words
	use({ "hrsh7th/cmp-path" }) -- Auto Completion for Paths
	use({ "hrsh7th/cmp-cmdline" }) -- Auto Completion for Commands
	use({ "hrsh7th/cmp-nvim-lsp" }) -- Auto Completion for Lsp Stuff

	-- Nice but not Needed
	use({ "akinsho/toggleterm.nvim" }) -- Floating Terminal
	use({ "nvim-pack/nvim-spectre" }) -- Global Search / Replace
	use({ "is0n/jaq-nvim" }) -- Run Code
	use({ "j-hui/fidget.nvim" }) -- Lsp UI
	use({ "goolord/alpha-nvim" }) -- Dashboard
	use({ "kyazdani42/nvim-tree.lua" }) -- File Explorer
	use({ "ghillb/cybu.nvim" }) -- Buffer Overview
	use({ "lukas-reineke/indent-blankline.nvim" }) -- Indent Highlighting
	use({ "fgheng/winbar.nvim" }) -- Shows Top Bar with PathGet File, Function, ...
	use({ "SmiteshP/nvim-navic" }) -- Get File, Function, ...
	use({ "karb94/neoscroll.nvim" }) -- Smooth Scrolling
	use({ "nacro90/numb.nvim" }) -- Smooth Jumping

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require("packer").sync()
	end
end)
