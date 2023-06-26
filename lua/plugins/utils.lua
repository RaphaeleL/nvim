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
        event = "VeryLazy",
        config = function()
            require("eyeliner").setup {
                highlight_on_key = true,
                dim = false
            }
            vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#ff00ff', bold = true, underline = false })
            vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#00ffff', underline = false })
        end
    },
    -- {
    --     "folke/which-key.nvim",
    --     event = "InsertEnter",
    --     config = function()
    --         vim.o.timeout = true
    --         vim.o.timeoutlen = 300
    --         require("which-key").setup({ })
    --     end
    -- },
    {
        "ThePrimeagen/harpoon",
        lazy = true,
        keys = {
            { "mm", ":lua require('harpoon.mark').add_file()<cr>", desc = "(NaaVim) [M]ark a File" },
            { "mn", ":lua require('harpoon.ui').nav_next()<cr>", desc = "(NaaVim) [M]ove to [n]ext File" },
            { "mp", ":lua require('harpoon.ui').nav_prev()<cr>", desc = "(NaaVim) [M]ove to [p]revious File" },
            { "mc", ":lua require('harpoon.mark').clear_all()<cr>", desc = "(NaaVim) [C]lear all Marks" },
            { "mr", ":lua require('harpoon.mark').rm_file()<cr>", desc = "(NaaVim) [R]emove Selected Mark" },
            { "ma", ":lua require('harpoon.ui').nav_file(1)<cr>", desc = "(NaaVim) [M]ove to 1" },
            { "ms", ":lua require('harpoon.ui').nav_file(2)<cr>", desc = "(NaaVim) [M]ove to 2" },
            { "md", ":lua require('harpoon.ui').nav_file(3)<cr>", desc = "(NaaVim) [M]ove to 3" },
            { "mf", ":lua require('harpoon.ui').nav_file(4)<cr>", desc = "(NaaVim) [M]ove to 4" },
        }
    }
}
