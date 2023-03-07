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
            { "<Leader>gt", ":Gitsigns toggle_deleted<cr>", desc = "(NaaVim) Gitsigns: [G]it [t]oggle deleted" },
        }
    },
    -- {
    --     "tpope/vim-fugitive",
    --     lazy = true,
    --     keys = {
    --         { "<Leader>g", ":Git<cr>", desc = "(NaaVim) Git: [G]it" },
    --         { "<Leader>gd", ":Git diff<cr>", desc = "(NaaVim) Git: [G]it [d]iff" },
    --         { "<Leader>ga", ":Git add .<cr>", desc = "(NaaVim) Git: [G]it [a]dd all" },
    --         { "<Leader>gc", ":Git commit<cr>", desc = "(NaaVim) Git: [G]it [c]ommit" },
    --         { "<Leader>gp", ":Git push<cr>", desc = "(NaaVim) Git: [G]it [p]ush" },
    --     }
    -- },
    -- {
    --     "rhysd/git-messenger.vim",
    --     lazy = true,
    --     keys = {
    --         { "<Leader>gl", ":GitMessenger<cr>", desc = "(NaaVim) Git: [G]it [L]ine Information" },
    --     }
    -- },
}
