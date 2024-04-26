return {
    -- {
    --     "github/copilot.vim"
    -- }
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = false, -- false for copilot in cmp, true for <c-l>
                    keymap = {
                        jump_next = "<C-j>",
                        jump_prev = "<C-k>",
                        accept = "<C-l>",
                        refresh = "r",
                        open = "<M-Cr>",
                    },
                },
                suggestion = {
                    enabled = false, -- false for copilot in cmp, true for <c-l>
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
