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
	use({ "mbbill/undotree" })
	use({ "lewis6991/impatient.nvim" })
	use({ "terrortylor/nvim-comment" })
	use({ "nvim-telescope/telescope.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "windwp/nvim-autopairs" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "nvim-lua/plenary.nvim" })

	-- UI
	use({ "akinsho/toggleterm.nvim" })
	use({ "folke/which-key.nvim" })
	use({ "romgrk/barbar.nvim" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "goolord/alpha-nvim" })
	use({ "SmiteshP/nvim-gps" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "nacro90/numb.nvim" })
	use({ "rcarriga/nvim-notify" })
	use({ "simrat39/symbols-outline.nvim" })

	-- Git
	use({ "lewis6991/gitsigns.nvim" })
	use({ "f-person/git-blame.nvim" })

	-- LSP
	use({ "onsails/lspkind.nvim" })
	use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "RRethy/vim-illuminate" })
	use({ "tamago324/nlsp-settings.nvim" })
	use({ "ray-x/lsp_signature.nvim" })

	-- Auto Completion
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "tpope/vim-sensible" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "saadparwaiz1/cmp_luasnip" })

	-- Colorscheme
	use({ "tjdevries/colorbuddy.vim" })
	use({ "olimorris/onedarkpro.nvim" })
	use({ "christianchiarulli/nvcode-color-schemes.vim" })
	use({ "shaeinst/roshnivim-cs" })
	use({ "Lunarvim/colorschemes" })
	use({ "lunarvim/darkplus.nvim" })
	use({ "tiagovla/tokyodark.nvim" })
	use({ "B4mbus/oxocarbon-lua.nvim" })
	use({ "folke/tokyonight.nvim" })
	use({ "sainnhe/gruvbox-material" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "p00f/nvim-ts-rainbow" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })

	-- Quickrun
	use({ "is0n/jaq-nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require("packer").sync()
	end
end)
