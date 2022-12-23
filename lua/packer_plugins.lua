local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd "packadd packer.nvim"
end

require('packer').startup(function(use)
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

  if is_bootstrap then
    require('packer').sync()
  end

end)

if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '    Give Treesitter and Mason a'
  print '   moment to install everything'
  print '        after opening nvim'
  print '=================================='
  return
end
