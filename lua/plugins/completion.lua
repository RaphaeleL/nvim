return {
    'saghen/blink.cmp',
    event = { "InsertEnter" },
    dependencies = {
        'rafamadriz/friendly-snippets',
        'mikavilpas/blink-ripgrep.nvim',
        'xzbdmw/colorful-menu.nvim',
    },
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "enter",
            ["<Tab>"] = {
                function(cmp)
                    if cmp.is_menu_visible() then
                        return require("blink.cmp").select_next()
                    elseif cmp.snippet_active() then
                        return cmp.snippet_forward()
                    end
                end,
                "fallback",
            },
            ["<S-Tab>"] = {
                function(cmp)
                    if cmp.is_menu_visible() then
                        return require("blink.cmp").select_prev()
                    elseif cmp.snippet_active() then
                        return cmp.snippet_backward()
                    end
                end,
                "fallback",
            },
            ['<C-n>'] = {},
            ['<C-p>'] = {},
        },
        signature = {
            enabled = true,
            window = {
                border = "rounded",
            },
        },
        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
                -- "lazydev",
                "ripgrep",
            },
            providers = {
                -- lazydev = {
                --     name = "LazyDev",
                --     module = "lazydev.integrations.blink",
                --     fallbacks = { "lsp" },
                -- },
                ripgrep = {
                    module = "blink-ripgrep",
                    name = "Ripgrep",
                    ---@module "blink-ripgrep"
                    ---@type blink-ripgrep.Options
                    opts = {
                        prefix_min_len = 3,
                        context_size = 5,
                        max_filesize = "1M",
                        ignore_paths = { "~/", "/" },
                    },
                },
            },
        },
        completion = {
            -- ghost_text = {
            --     enabled = true,
            -- },
            keyword = {
                range = "full",
            },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true,
                },
            },
            accept = {
                auto_brackets = {
                    enabled = true,
                    override_brackets_for_filetypes = {
                        tex = { "{", "}" },
                    },
                },
            },
            menu = {
                -- auto_show = function(ctx) return ctx.mode ~= 'cmdline' end,
                min_width = 20,
                border = "rounded",
                winhighlight =
                "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                draw = {
                    columns = { { "kind_icon" }, { "label", gap = 1 }, { "source" } },
                    -- columns = { { "label", gap = 1 }, { "source" } },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                        source = {
                            text = function(ctx)
                                local map = {
                                    ["lsp"] = "LSP",
                                    ["path"] = "PATH",
                                    ["snippets"] = "SNIP",
                                }
                                return map[ctx.item.source_id]
                            end,
                            highlight = "BlinkCmpSource",
                        },
                    },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 10,
                update_delay_ms = 10,
                window = {
                    max_width = math.min(80, vim.o.columns),
                    border = "rounded",
                },
            },
        },
    },
    --     "hrsh7th/nvim-cmp",
    --     event = "InsertEnter",
    --     dependencies = {
    --         { "hrsh7th/cmp-nvim-lsp",   event = "InsertEnter" },
    --         { "hrsh7th/cmp-buffer",     event = "InsertEnter" },
    --         { "hrsh7th/cmp-path",       event = "InsertEnter" },
    --         { "hrsh7th/cmp-cmdline",    event = "InsertEnter" },
    --         { "onsails/lspkind.nvim",   event = "InsertEnter" },
    --         { "zbirenbaum/copilot-cmp", event = "InsertEnter" },
    --     },
    --     config = function()
    --         local cmp = require("cmp")
    --         local lspkind = require("lspkind")
    --         lspkind.init({
    --             symbol_map = {
    --                 Copilot = "",
    --             },
    --         })
    --         require("copilot_cmp").setup()
    --
    --         local has_words_before = function()
    --             if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    --                 return false
    --             end
    --             local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --             return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
    --         end
    --
    --         local cmp_settings = {
    --             formatting = {
    --                 fields = { "kind", "abbr", "menu" },
    --                 format = function(entry, vim_item)
    --                     local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
    --                     local strings = vim.split(kind.kind, "%s", { trimempty = true })
    --                     kind.kind = " " .. (strings[1] or "") .. " "
    --                     kind.menu = strings[2]
    --                     return kind
    --                 end,
    --             },
    --             window = {
    --                 -- completion = cmp.config.window.bordered(),
    --                 -- documentation = cmp.config.window.bordered(),
    --             },
    --             mapping = cmp.mapping.preset.insert({
    --                 ["<C-p>"] = cmp.mapping.select_prev_item(),
    --                 ["<C-n>"] = cmp.mapping.select_next_item(),
    --                 ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    --                 ["<C-Space>"] = cmp.mapping.complete(),
    --                 ["<CR>"] = cmp.mapping.confirm({
    --                     behavior = cmp.ConfirmBehavior.Replace,
    --                     select = true,
    --                 }),
    --                 ["<Tab>"] = cmp.mapping(function(fallback)
    --                     if cmp.visible() and has_words_before() then
    --                         cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    --                     else
    --                         fallback()
    --                     end
    --                 end, { "i", "s" }),
    --             }),
    --             sources = cmp.config.sources({
    --                 { name = "copilot" },
    --                 { name = "nvim_lsp" },
    --             }, {
    --                 { name = "buffer" },
    --             }),
    --         }
    --
    --         cmp.setup(cmp_settings)
    --     end,
}
