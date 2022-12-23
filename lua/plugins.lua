local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  { "mbbill/undotree", lazy = true },
  { "lewis6991/gitsigns.nvim", lazy = true },
  { "lewis6991/impatient.nvim", lazy = true },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "tpope/vim-fugitive", lazy = true },
  { "rose-pine/neovim", lazy = true },
  { "nvim-telescope/telescope.nvim", enabled = true },
  { "nvim-treesitter/nvim-treesitter", lazy = true },
  { "terrortylor/nvim-comment", lazy = true },
  { "VonHeikemen/lsp-zero.nvim", lazy = true },
  { "neovim/nvim-lspconfig", lazy = true },
  { "williamboman/mason.nvim", lazy = true },
  { "williamboman/mason-lspconfig.nvim", lazy = true },
  { "hrsh7th/nvim-cmp", lazy = true },
  { "hrsh7th/cmp-buffer", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  { "saadparwaiz1/cmp_luasnip", lazy = true },
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-nvim-lua", lazy = true },
  { "L3MON4D3/LuaSnip", lazy = true },
  { "rafamadriz/friendly-snippets", lazy = true },
})
