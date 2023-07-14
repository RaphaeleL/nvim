return {
    {
        "terrortylor/nvim-comment",
        event = "VeryLazy",
        config = function()
            require("nvim_comment").setup()
        end,
        keys = {
            { "<Leader>l", ":CommentToggle<cr>", desc = " Comment Selection" }
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
            vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = "#ff00ff", bold = true, underline = false })
            vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = "#00ffff", underline = false })
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            plugins = { spelling = true },
            defaults = {
                mode = { "n", "v" },
                ["<leader>e"] = { name = "File Explorer" },
                ["<leader>S"] = { name = "Search / Replace" },
                ["<leader>r"] = { name = "Rename" },
                ["<leader>c"] = { name = "Compile" },
                ["<leader>f"] = { name = "+File" },
                ["<leader>g"] = { name = "+Git" },
                ["<leader>s"] = { name = "+Telescope" },
                ["<leader>d"] = { name = "+Diagnostics" },
                ["<leader>t"] = { name = "+Terminal" },
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)
        end,
    },
    {
        "nvim-pack/nvim-spectre",
        cmd = "Spectre",
        opts = { open_cmd = "noswapfile vnew" },
        keys = {
            { "<leader>S", function() require("spectre").open() end, desc = "Search and Replace in files" },
        },
    },
    -- {
    --     "RRethy/vim-illuminate",
    --     event = { "BufReadPost", "BufNewFile" },
    --     opts = {
    --         delay = 200,
    --         large_file_cutoff = 2000,
    --         large_file_overrides = {
    --             providers = { "lsp" },
    --         },
    --     },
    --     config = function(_, opts)
    --         require("illuminate").configure(opts)
    --
    --         local function map(key, dir, buffer)
    --             vim.keymap.set("n", key, function()
    --                 require("illuminate")["goto_" .. dir .. "_reference"](false)
    --             end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    --         end
    --
    --         map("]]", "next")
    --         map("[[", "prev")
    --
    --         -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
    --         vim.api.nvim_create_autocmd("FileType", {
    --             callback = function()
    --                 local buffer = vim.api.nvim_get_current_buf()
    --                 map("]]", "next", buffer)
    --                 map("[[", "prev", buffer)
    --             end,
    --         })
    --     end,
    --     keys = {
    --         { "]]", desc = "Next Reference" },
    --         { "[[", desc = "Prev Reference" },
    --     },
    -- },
    {
        "folke/trouble.nvim",
        lazy = true,
        cmd = { "TroubleToggle", "Trouble" },
        opts = { icons = false, use_diagnostic_signs = true },
        keys = {
            { "<leader>ds", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
            { "<leader>dw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
            { "<leader>dl", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List (Trouble)" },
            { "<leader>dq", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List (Trouble)" },
            {
                "<leader>dn",
                function()
                    if require("trouble").is_open() then
                        require("trouble").previous({ skip_groups = true, jump = true })
                    else
                        local ok, err = pcall(vim.cmd.cprev)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Previous trouble/quickfix item",
            },
            {
                "<leader>dp",
                function()
                    if require("trouble").is_open() then
                        require("trouble").next({ skip_groups = true, jump = true })
                    else
                        local ok, err = pcall(vim.cmd.cnext)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Next trouble/quickfix item",
            },
        },
    },

    {
        "akinsho/toggleterm.nvim",
        lazy = true,
        version = "*",
        config = true,
        keys = {
            { "<Leader>tt", ":ToggleTerm<cr>", desc = "Terminal" }
        }
    }
}
