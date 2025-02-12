return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
        suggestion = {
            enabled = false,
            auto_trigger = true,
        },
        panel = { enabled = false },
        filetypes = {
            markdown = true,
            yaml = true,
            help = true,
        },
    },
}
