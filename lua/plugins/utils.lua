return {
    -- {
    --     "mbbill/undotree",
    --     lazy = true,
    --     keys = {
    --         { "su", ":UndotreeToggle<cr>" },
    --     }
    -- },
    {
        "terrortylor/nvim-comment",
        event = "VeryLazy",
        config = function()
            require("nvim_comment").setup()
        end,
        keys = {
            { "<Leader>l", ":CommentToggle<cr>", desc = "Comment Selection" }
        }
    },
}
