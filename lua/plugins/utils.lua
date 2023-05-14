return {
    {
        "cshuaimin/ssr.nvim",
        lazy = true,
        keys = {
            {
                "<leader>S",
                ":lua require('ssr').open()<cr>",
                desc = "(NaaVim) Structure [S]earch and Replace (hovered Element)"
            }
        },
        config = function()
            require("ssr").setup {
                min_width = 50,
                min_height = 5,
                max_width = 120,
                max_height = 25,
                keymaps = {
                    close = "q",
                    next_match = "n",
                    prev_match = "N",
                    replace_confirm = "<cr>",
                    replace_all = "<leader><cr>",
                },
            }
        end
    },
    {
        "terrortylor/nvim-comment",
        event = "VeryLazy",
        config = function()
            require("nvim_comment").setup()
        end,
        keys = {
            { "<Leader>l", ":CommentToggle<cr>", desc = "(NaaVim) Comment Selection" }
        }
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        "jinh0/eyeliner.nvim",
        config = function()
            require("eyeliner").setup {
                highlight_on_key = true,
                dim = false
            }
        end
    },
}
