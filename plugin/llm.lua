require("copilot").setup({
    suggestion = {
        enabled = not true,
        auto_trigger = true,
        hide_during_completion = false,
        keymap = {
            accept = "<M-l>",
            next = "<M-n>",
            prev = "<M-p>",
        },
    },
    panel = { enabled = not true },
    filetypes = {
        markdown = true,
        yaml = true,
        help = true,
    },
})
