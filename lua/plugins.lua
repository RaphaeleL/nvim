local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

return require("packer").startup(function()
  use "wbthomason/packer.nvim"
  use "navarasu/onedark.nvim"
  use "shaeinst/roshnivim-cs"
  use "akinsho/toggleterm.nvim"
  use "folke/which-key.nvim"
  use "terrortylor/nvim-comment"
  use "hrsh7th/nvim-compe"
  use "windwp/nvim-autopairs"
  use "glepnir/dashboard-nvim" 
  use { "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" }
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", }
  use { "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons", }
  use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"}
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }
  use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }
  use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  }
end)
