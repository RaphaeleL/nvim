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
                -- numhl = true,
                signs = {
                    add = { text = "▎" },
                    change = { text = "▎" },
                    delete = { text = "󰐊" },
                    topdelete = { text = "󰐊" },
                    changedelete = { text = "▎" },
                    untracked = { text = "▎" },
                },
            }
        end,
        keys = {
            { "<Leader>gd", ":Gitsigns toggle_deleted<cr>", desc = "(NaaVim) Gitsigns: [G]it [t]oggle deleted" },
            { "<Leader>gn", ":Gitsigns toggle_numhl<cr>", desc = "(NaaVim) Gitsigns: [G]it [t]oggle Line Number Signs" },
            { "<Leader>gs", ":Gitsigns toggle_signs<cr>", desc = "(NaaVim) Gitsigns: [G]it [t]oggle Signs" },
        }
    },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        keys = {
            { "<Leader>gg", ":LazyGit<cr>", desc = "(NaaVim) [G]it: Lazy[G]it" },
        }
    },
}
