vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"

  use "lewis6991/impatient.nvim"
  use { "mbbill/undotree", opts = true }

  use "nvim-lua/plenary.nvim"

  use { "tpope/vim-fugitive", opts = true }

  use { "nvim-telescope/telescope.nvim", opts = true }

  use "nvim-treesitter/nvim-treesitter"

  use { "terrortylor/nvim-comment", opts = true }
  use { "lewis6991/gitsigns.nvim", opts = true }
  use { "RRethy/vim-illuminate", opts = true }

  use {
    "VonHeikemen/lsp-zero.nvim",
    opts = true,
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
    }
  }

  use "lunarvim/darkplus.nvim"
  -- use "rebelot/kanagawa.nvim"
  -- use "rose-pine/neovim"
  -- use "catppuccin/nvim"


end)
