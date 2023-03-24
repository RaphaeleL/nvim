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
}
