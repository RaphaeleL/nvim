return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            local ok, gitsigns = pcall(require, "gitsigns")
            if not ok then
                require("notify")("Couldn't require gitsigns", "error")
                return
            end

            gitsigns.setup {
                numhl = true,
                signs = {
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "+" },
                },
            }
        end,
        keys = {
            { "<Leader>gt", ":Gitsigns toggle_deleted<cr>", desc = "Gitsigns: [G]it [t]oggle deleted" },
            -- { "<Leader>glb", ":Gitsigns blame_line<cr>", desc = "Git: [G]it [L]ine Information" },
        }
    },
    {
        "tpope/vim-fugitive",
        lazy = true,
        keys = {
            { "<Leader>g", ":Git<cr>", desc = "Git: [G]it" },
            { "<Leader>gd", ":Git diff<cr>", desc = "Git: [G]it [d]iff" },
            -- { "<Leader>gb", ":Git blame<cr>", desc = "Git: [G]it [b]lame" },
            { "<Leader>ga", ":Git add .<cr>", desc = "Git: [G]it [a]dd all" },
            { "<Leader>gc", ":Git commit<cr>", desc = "Git: [G]it [c]ommit" },
            { "<Leader>gp", ":Git push<cr>", desc = "Git: [G]it [p]ush" },
        }
    },
    {
        "rhysd/git-messenger.vim",
        lazy = true,
        keys = {
            { "<Leader>gl", ":GitMessenger<cr>", desc = "Git: [G]it [L]ine Information" },
        }
    },
}
