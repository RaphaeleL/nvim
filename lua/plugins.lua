local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
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

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"

  use "mbbill/undotree"
  use "lewis6991/impatient.nvim"
  use "nvim-lua/plenary.nvim"

  use "tpope/vim-fugitive"

  use "rose-pine/neovim"

  use "nvim-telescope/telescope.nvim"

  use "nvim-treesitter/nvim-treesitter"

  use "terrortylor/nvim-comment"

  use {
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
