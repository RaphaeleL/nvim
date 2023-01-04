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
    -- ============================================
    --      BASIC PLUGINS
    -- ============================================
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
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
        "lewis6991/impatient.nvim",
        lazy = true,
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true
    },
    --
    -- ============================================
    --      LANGUAGE SERVER PROTOCOL
    -- ============================================
    --
    -- TODO: is this able to lazy load? Somehow only
    -- load if a lsp supported file is open. The
    -- startup time for the mentioned file would be
    -- halved!
    --
    {
        "VonHeikemen/lsp-zero.nvim",
        enabled = true,
        -- lazy = true,
        -- event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
        },
    },
    --
    -- ============================================
    --      USEFUL BUT NOT NECESSARY
    -- ============================================
    --
    -- these plugins are lazy loaded. so there is no
    -- problem to keep them and load them only when
    -- the key combination is actually pressed or the
    -- event is triggered.
    --
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
    -- {
    --     "lewis6991/gitsigns.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("gitsigns").setup {
    --             signs = {
    --                 add = { text = "+" },
    --                 change = { text = "~" },
    --                 delete = { text = "_" },
    --                 topdelete = { text = "‾" },
    --                 changedelete = { text = "~" },
    --                 -- add = { text = "│" },
    --                 -- change = { text = "│" },
    --                 -- delete = { text = "_" },
    --                 -- topdelete = { text = "‾" },
    --                 -- changedelete = { text = "~" },
    --                 -- untracked = { text = "│" },
    --             },
    --         }
    --     end,
    -- },
    -- {
    --     "RRethy/vim-illuminate",
    --     event = "VeryLazy",
    --     config = function()
    --         require("illuminate")
    --     end,
    -- },
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     event = "VeryLazy",
    -- },
    --
    -- ============================================
    --      COLORSCHEME COLLECTION
    -- ============================================
    --
    -- if you can't set a transparent background (to
    -- create a consistent color scheme through the
    -- actual terminal), there is a useful plugin that
    -- will do it for you: xiyaowong/nvim-transparent
    --
    -- {
    --   "rebelot/kanagawa.nvim",
    --   lazy = true,
    --   config = function()
    --     require("kanagawa").setup({ transparent = true })
    --   end
    -- },
    {
        "lunarvim/darkplus.nvim",
        lazy = true,
    },
    -- {
    --   "rose-pine/neovim",
    --   lazy = true,
    --   config = function()
    --     require("rose-pine").setup({ disable_background = true })
    --   end
    -- },
    -- {
    --   "catppuccin/nvim",
    --   name = "catppuccin",
    --   lazy = true,
    --   config = function()
    --     require("catppuccin").setup({ transparent_background = true })
    --   end
    -- },
})
