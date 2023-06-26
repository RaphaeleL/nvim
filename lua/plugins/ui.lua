return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        config = function()
            local ok, treesitter = pcall(require, "nvim-treesitter.configs")
            if not ok then
                require("notify")("Couldn't require nvim-treesitter.configs", "error")
                return
            end
            treesitter.setup({
                ensured_installed = {
                    "html", "markdown", "markdown-inline", "bash",
                    "comment", "scss", "css", "html", "javascript",
                    "typescript", "lua", "vimdoc", "regex", "toml",
                    "yaml", "c", "cpp", "haskell", "java", "python",
                    "rust", "go", "php", "swift", "kotlin", "latex",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                },
                rainbow = {
                    enable = true,
                    colors = {
                        "#68a0b0",
                        "#946EaD",
                        "#c7aA6D",
                    },
                },
            })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
    },
    -- {
    --     "utilyre/barbecue.nvim",
    --     name = "barbecue",
    --     event = "VeryLazy",
    --     dependencies = {
    --         "SmiteshP/nvim-navic",
    --     },
    --     opts = {
    --         show_dirname = false,
    --     },
    -- },
    -- {
    --     "nvim-lualine/lualine.nvim",
    --     event = "VeryLazy",
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
    --                 theme = bubbles_theme, -- 'iceberg_dark',
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
    --                             error = "E", --" ",
    --                             warn = "W",  --" ",
    --                             info = "I",  --" ",
    --                             hint = "H",  --" ",
    --                         },
    --                         diagnostics_color = {
    --                             error = { colors.white }, --'DiagnosticError',
    --                             warn  = { colors.white }, --'DiagnosticWarn',
    --                             info  = { colors.white }, --'DiagnosticInfo',
    --                             hint  = { colors.white }, --'DiagnosticHint',
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
