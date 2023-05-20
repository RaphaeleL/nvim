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
            vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#ff00ff', bold = true, underline = false })
            vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#00ffff', underline = false })
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({

            })
        end
    },
    {
        "ThePrimeagen/harpoon",
        keys = {
            { "<leader>ma", ":lua require('harpoon.mark').add_file()<cr>", desc = "(NaaVim) [M]ark a File" },
            { "<leader>mn", ":lua require('harpoon.ui').nav_next()<cr>", desc = "(NaaVim) [M]ove to [n]ext File" },
            { "<leader>mp", ":lua require('harpoon.ui').nav_prev()<cr>", desc = "(NaaVim) [M]ove to [p]revious File" },
        }
    }
}
