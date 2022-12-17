vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  use { "wbthomason/packer.nvim" }

  -- UNSURED IF YOU WILL SURVIVE THE DECLUTTER
  use { "j-hui/fidget.nvim" } -- simply useless
  use { "nvim-telescope/telescope-file-browser.nvim" } -- netrw

  -- Basic Plugins
  use { "mbbill/undotree" } -- Undo History
  use { "lewis6991/impatient.nvim" } -- Better Performance
  use { "nvim-lua/plenary.nvim" } -- some Lua Functions

  -- Git
  use { "lewis6991/gitsigns.nvim" } -- Gitsigns beside Numbers
  use { "kdheepak/lazygit.nvim" } -- Git Commands in Nvim

  -- Colorscheme
  use { "catppuccin/nvim", as = "catppuccin" } -- Colorscheme

  -- Telescope
  use { "nvim-telescope/telescope.nvim" } -- File Explorer

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter" } -- Syntax Highlighting

  -- LSP
  use {
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require("packer").sync()
  end
end)
