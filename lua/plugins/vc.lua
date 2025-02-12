return {
    {
        "tpope/vim-fugitive",
        lazy = true,
        keys = {
            { "<Leader>ga", ":Git add .<cr>",         desc = " [G]it add ." },
            { "<Leader>gc", ":Git commit<cr>",        desc = " [G]it commit" },
            { "<Leader>gp", ":Git push<cr>",          desc = " [G]it push" },
            { "<Leader>gP", ":Git pull --rebase<cr>", desc = " [G]it pull --rebase" },
            { "<Leader>gd", ":Git diff<cr>",          desc = " [G]it diff" },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            -- numhl = true,
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "󰐊" },
                topdelete = { text = "󰐊" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
        },
        keys = {
            { "<Leader>gr", ":Gitsigns toggle_deleted<cr>", desc = " Gitsigns: [G]it [t]oggle deleted" },
            { "<Leader>gn", ":Gitsigns toggle_numhl<cr>",   desc = " Gitsigns: [G]it [t]oggle Line Number Signs" },
            { "<Leader>gs", ":Gitsigns toggle_signs<cr>",   desc = " Gitsigns: [G]it [t]oggle Signs" },
        },
    },
    {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
}
}
