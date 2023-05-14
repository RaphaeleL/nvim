return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = true, -- false for copilot in cmp
                    keymap = {
                        jump_next = "<c-j>",
                        jump_prev = "<c-k>",
                        accept = "<c-l>",
                        refresh = "r",
                        open = "<M-CR>",
                    },
                },
                suggestion = {
                    enabled = true, -- false for copilot in cmp
                    auto_trigger = true,
                    keymap = {
                        accept = "<c-l>",
                        next = "<c-j>",
                        prev = "<c-k>",
                        dismiss = "<c-h>",
                    },
                },
            })
            require("copilot.suggestion").is_visible()
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
    },
}
