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
  {
    "mbbill/undotree", lazy = true,
    keys = {
      { "su", ":UndotreeToggle<cr>" },
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }
    end,
  },
  {
    "lewis6991/impatient.nvim",
    lazy = true,
    config = function()
      require("impatient").setup()
    end,
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "tpope/vim-fugitive",
    lazy = true,
    keys = {
      { "<Leader>g", ":Git<cr>" },
      { "<Leader>gd", ":Git diff<cr>" },
      { "<Leader>gb", ":Git blame<cr>" },
      { "<Leader>ga", ":Git add .<cr>" },
      { "<Leader>gc", ":Git commit<cr>" },
      { "<Leader>gp", ":Git push<cr>" },
    }

  },
  {
    "rose-pine/neovim",
    lazy = true,
  },
  { "nvim-treesitter/nvim-treesitter", lazy = true },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()
    end,
    keys = {
      { "<Leader>l", ":CommentToggle<cr>" }
    }
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    keys = {
      { "e", ":Telescope find_files<cr>" },
      { "el", ":Telescope live_grep<cr>" },
      { "eg", ":Telescope git_files<cr>" },
      { "sb", ":Telescope buffers<cr>" },
      { "sd", ":Telescope diagnostics<cr>" },
      { "sw", ":Telescope grep_string<cr>" },
      { "ds", ":Telescope lsp_document_symbols<cr>" },
    }
  },
  { "L3MON4D3/LuaSnip", lazy = true },
  { "rafamadriz/friendly-snippets", lazy = true },
  { "saadparwaiz1/cmp_luasnip", lazy = true },
  -- Always Loading Lsp
  { "VonHeikemen/lsp-zero.nvim", enabled = true },
  { "neovim/nvim-lspconfig", enabled = true },
  { "williamboman/mason.nvim", enabled = true },
  { "williamboman/mason-lspconfig.nvim", enabled = true },
  { "hrsh7th/nvim-cmp", enabled = true },
  { "hrsh7th/cmp-buffer", enabled = true },
  { "hrsh7th/cmp-path", enabled = true },
  { "hrsh7th/cmp-nvim-lsp", enabled = true },
  { "hrsh7th/cmp-nvim-lua", enabled = true },
})
