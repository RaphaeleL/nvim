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
                ["<leader>f"] = { name = "+File / Buffer" },
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
    },
    -- {
    --     "nvim-lualine/lualine.nvim",
    --     config = function()
    --         local colors = {
    --             blue = "#80a0ff",
    --             cyan = "#79dac8",
    --             black = "#262626",
    --             white = "#c6c6c6",
    --             red = "#ff5189",
    --             violet = "#d183e8",
    --             grey = "#303030",
    --         }
    --
    --         local bubbles_theme = {
    --             normal = {
    --                 a = { fg = colors.black, bg = colors.violet },
    --                 b = { fg = colors.white, bg = colors.grey },
    --                 c = { fg = colors.black, bg = colors.black },
    --             },
    --
    --             insert = { a = { fg = colors.black, bg = colors.blue } },
    --             visual = { a = { fg = colors.black, bg = colors.cyan } },
    --             replace = { a = { fg = colors.black, bg = colors.red } },
    --
    --             inactive = {
    --                 a = { fg = colors.white, bg = colors.black },
    --                 b = { fg = colors.white, bg = colors.black },
    --                 c = { fg = colors.black, bg = colors.black },
    --             },
    --         }
    --
    --         local function diff_source()
    --             local gitsigns = vim.b.gitsigns_status_dict
    --             if gitsigns then
    --                 return {
    --                     added = gitsigns.added,
    --                     modified = gitsigns.changed,
    --                     removed = gitsigns.removed,
    --                 }
    --             end
    --         end
    --         require('lualine').setup {
    --             options = {
    --                 icons_enabled = true,
    --                 theme = bubbles_theme,  -- 'iceberg_dark',
    --                 component_separators = { left = '', right = '' },
    --                 section_separators = { left = '', right = '' },
    --                 disabled_filetypes = {
    --                     statusline = {},
    --                     winbar = {},
    --                 },
    --                 ignore_focus = {},
    --                 always_divide_middle = true,
    --                 globalstatus = false,
    --                 refresh = {
    --                     statusline = 1000,
    --                     tabline = 1000,
    --                     winbar = 1000,
    --                 }
    --             },
    --             sections = {
    --                 lualine_a = {},
    --                 lualine_b = {
    --                     'branch',
    --                     {
    --                         "diff",
    --                         source = diff_source,
    --                         padding = { left = 0, right = 0 },
    --                         -- symbols = {
    --                         --     added = " ",
    --                         --     modified = " ",
    --                         --     removed = " ",
    --                         -- },
    --                         diff_color = {
    --                             added = { colors.white },
    --                             modified = { colors.white },
    --                             removed = { colors.white },
    --                         },
    --                     },
    --                     {
    --                         "diagnostics",
    --                         sources = { "nvim_diagnostic" },
    --                         symbols = {
    --                             error = "E",  --" ",
    --                             warn = "W",   --" ",
    --                             info = "I",   --" ",
    --                             hint = "H",   --" ",
    --                         },
    --                         diagnostics_color = {
    --                             error = { colors.white },  --'DiagnosticError',
    --                             warn  = { colors.white },  --'DiagnosticWarn',
    --                             info  = { colors.white },  --'DiagnosticInfo',
    --                             hint  = { colors.white },  --'DiagnosticHint',
    --                         },
    --                     },
    --                 },
    --                 lualine_c = {},
    --                 lualine_x = {},
    --                 lualine_y = {
    --                     {
    --                         'location'
    --                     },
    --                     {
    --                         function()
    --                             local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
    --                             if #buf_clients == 0 then
    --                                 return "LSP Inactive"
    --                             end
    --
    --                             local buf_client_names = {}
    --                             local copilot_active = false
    --
    --                             for _, client in pairs(buf_clients) do
    --                                 if client.name ~= "null-ls" and client.name ~= "copilot" then
    --                                     table.insert(buf_client_names, client.name)
    --                                 end
    --
    --                                 if client.name == "copilot" then
    --                                     copilot_active = true
    --                                 end
    --                             end
    --
    --                             if copilot_active then
    --                                 return ""
    --                             end
    --                             return ""
    --                         end
    --                     },
    --                     {
    --                         function()
    --                             local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
    --                             return "󰌒 " .. shiftwidth
    --                         end,
    --                         padding = 1,
    --                     },
    --                     {
    --                         'filetype'
    --                     },
    --                 },
    --                 lualine_z = {
    --                     {
    --                         "progress",
    --                         fmt = function()
    --                             return "%P/%L"
    --                         end,
    --                         color = {
    --                             fg = colors.white,
    --                             bg = colors.black
    --                         },
    --                     } }
    --             },
    --             inactive_sections = {
    --                 lualine_a = {},
    --                 lualine_b = {},
    --                 lualine_c = { 'filename' },
    --                 lualine_x = { 'location' },
    --                 lualine_y = {},
    --                 lualine_z = {}
    --             },
    --             tabline = {},
    --             winbar = {},
    --             inactive_winbar = {},
    --             extensions = {}
    --         }
    --     end
    -- }
}
