local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

return require("packer").startup(function()
	use "wbthomason/packer.nvim"
	use {
    		"kyazdani42/nvim-tree.lua",
    		requires = {
      			"kyazdani42/nvim-web-devicons", 
    		},
    		config = function() require"nvim-tree".setup {} end
	}
  use {"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"}
  use "shaeinst/roshnivim-cs"
  use "akinsho/toggleterm.nvim"
  use {
    "windwp/nvim-autopairs", 
    config = function() require("nvim-autopairs").setup{} end
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  }
  use "xiyaowong/nvim-transparent"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup { }
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }
  use {
      "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  }
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  use "hrsh7th/nvim-compe"
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup { }
    end
  }
  use {
    "terrortylor/nvim-comment",
    config = function() 
      require("nvim_comment").setup { }
    end 
  }


end)
