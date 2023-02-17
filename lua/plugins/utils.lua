return {
    {
        "cshuaimin/ssr.nvim",
        lazy = true,
        keys = {
            { "ssr", ":lua require('ssr').open()<cr>", desc = "(NaaVim) [S]tructure [S]earch and [R]eplace" }
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
        "windwp/nvim-spectre",
        lazy = true,
        keys = {
            { "<leader>S", ":lua require('spectre').open()<cr>" },
        }
    },
    -- {
    --     "folke/which-key.nvim",
    --     lazy = true,
    --     keys = {
    --         { "<leader><leader>", ":WhichKey<cr>", desc = "(NaaVim) Open WhichKey" },
    --     },
    --     config = function()
    --         vim.o.timeout = true
    --         vim.o.timeoutlen = 300
    --         require("which-key").setup({ })
    --     end,
    -- },
}
