local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

return require("packer").startup(function()
    use { "wbthomason/packer.nvim" }
    
    -- Plugins
    use { "mbbill/undotree" }
    use { "Chiel92/vim-autoformat" }
    use { "lewis6991/impatient.nvim" }
    use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }
    use { "terrortylor/nvim-comment" }

    -- UI
    use { "akinsho/toggleterm.nvim" }
    use { "folke/which-key.nvim" }
    use { "romgrk/barbar.nvim", requires = {"kyazdani42/nvim-web-devicons"} }
    use { "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons", }
    use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }
    use { "goolord/alpha-nvim" }
    use { "SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter" }
    use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }
    use { "nacro90/numb.nvim" }

    -- LSP Diagnostics
    use { "onsails/lspkind.nvim" }
    use { "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    
    -- Auto Completion
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-cmdline" }

    use { "github/copilot.vim" }
    use { "tpope/vim-sensible" }
    
    use { "tzachar/cmp-tabnine", run="./install.sh", requires = "hrsh7th/nvim-cmp"}
    
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "tamago324/nlsp-settings.nvim" }
    
    -- Colorscheme
    use { "christianchiarulli/nvcode-color-schemes.vim" }
    use { "shaeinst/roshnivim-cs" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter" }
    
    -- Snippets
    use { "L3MON4D3/LuaSnip" }
    use { "rafamadriz/friendly-snippets" }
    use { "saadparwaiz1/cmp_luasnip" }
    
end)
