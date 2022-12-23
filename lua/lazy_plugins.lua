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
  -- =================================================================
  -- Basic Plugins
  -- =================================================================
  {
    "rose-pine/neovim",
    lazy = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
  },
  {
    "terrortylor/nvim-comment",
    lazy = true,
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
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
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
  {
    "nvim-lua/plenary.nvim",
    lazy = true
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    enabled = true,
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
    }
  },
  -- =================================================================

  -- =================================================================
  -- NOT SURE IF YOU WILL SURVIVE THE DECLUTTERING
  -- =================================================================
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
    "mbbill/undotree",
    lazy = true,
    keys = {
      { "su", ":UndotreeToggle<cr>" },
    }
  },
  -- =================================================================
})
