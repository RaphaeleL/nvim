return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    -- event = "BufReadPost",
    event = "InsertEnter",
    opts = {
        suggestion = {
            enabled = not vim.g.ai_cmp,
            auto_trigger = true,
            hide_during_completion = vim.g.ai_cmp,
            keymap = {
                accept = "<M-l>",
                next = "<M-n>",
                prev = "<M-p>",
            },
        },
        panel = { enabled = false },
        filetypes = {
            markdown = true,
            yaml = true,
            help = true,
        },
    },
}
