return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup {
                signs = {
                    -- add = { text = "+" },
                    -- change = { text = "~" },
                    -- delete = { text = "_" },
                    -- topdelete = { text = "‾" },
                    -- changedelete = { text = "~" },
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    -- untracked = { text = "│" },
                },
            }
        end,
    },
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
}
