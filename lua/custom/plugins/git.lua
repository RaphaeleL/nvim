return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup {
                signs = {
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    -- untracked = { text = "+" },
                },
            }
        end,
    },
    {
        "tpope/vim-fugitive",
        lazy = true,
        keys = {
            { "<Leader>g", ":Git<cr>", desc = "Git: Git" },
            { "<Leader>gd", ":Git diff<cr>", desc = "Git: Git diff" },
            { "<Leader>gb", ":Git blame<cr>", desc = "Git: Git blame" },
            { "<Leader>ga", ":Git add .<cr>", desc = "Git: Git add all" },
            { "<Leader>gc", ":Git commit<cr>", desc = "Git: Git commit" },
            { "<Leader>gp", ":Git push<cr>", desc = "Git: Git Push" },
        }
    },
    {
        "rhysd/git-messenger.vim",
        lazy = true,
        keys = {
            { "<Leader>gm", ":GitMessenger<cr>", desc = "Git: Line Information" },
        }
    },
}
