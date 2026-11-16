local gh = function(x) return "https://github.com/" .. x end

vim.pack.add({

	{ src = gh("nvim-lua/plenary.nvim") },
	{ src = gh("terrortylor/nvim-comment") },
	-- { src = gh("NStefan002/visual-surround.nvim") },
	{ src = gh("MagicDuck/grug-far.nvim") },
	{ src = gh("nvim-mini/mini.align") },
	{ src = gh("stevearc/conform.nvim"), version = vim.version.range("*")},
	{ src = gh("kdheepak/lazygit.nvim") },

	{ src = gh("nvim-treesitter/nvim-treesitter") },
	-- { src = gh("mcauley-penney/visual-whitespace.nvim") },
	{ src = gh("lewis6991/gitsigns.nvim"), version = vim.version.range("*") },
	{ src = gh("j-hui/fidget.nvim") },

	{ src = gh("rose-pine/neovim") },
	-- { src = gh("blazkowolf/gruber-darker.nvim") },
	-- { src = gh("rebelot/kanagawa.nvim") },
	-- { src = gh("catppuccin/nvim") },

	{ src = gh("stevearc/oil.nvim"), version = vim.version.range("*")  },
	{ src = gh("nvim-telescope/telescope.nvim"), version = vim.version.range("*")  },
	-- { src = gh("ThePrimeagen/harpoon"), version = "harpoon2"  },

	{ src = gh("saghen/blink.cmp"), version = vim.version.range("1.*") },

	{ src = gh("neovim/nvim-lspconfig") },
	{ src = gh("mason-org/mason.nvim"), version = vim.version.range("2.*") },
	{ src = gh("mason-org/mason-lspconfig.nvim"), version = vim.version.range("2.*") },
	{ src = gh("WhoIsSethDaniel/mason-tool-installer.nvim") },

}, {confirm = false})
