return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
            "onsails/lspkind.nvim",
        },
        config = function()
            vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
            vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

            local border = {
                {"🭽", "FloatBorder"},
                {"▔", "FloatBorder"},
                {"🭾", "FloatBorder"},
                {"▕", "FloatBorder"},
                {"🭿", "FloatBorder"},
                {"▁", "FloatBorder"},
                {"🭼", "FloatBorder"},
                {"▏", "FloatBorder"},
            }

            local handlers =  {
                ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
                ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
            }

            require("fidget").setup({
                notification = {
                    window = {
                        winblend = 0,
                    }
                }
            })
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls", "cssls", "eslint", "html", "jsonls", "lua_ls", "pyright", "pylsp", "rust_analyzer", "tailwindcss", "taplo", "tsserver", "yamlls", "gopls"
                },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({handlers = handlers})
                    end,
                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                },
                            },
                        })
                    end
                },
            })

            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            luasnip.config.setup({})

            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. (strings[1] or "") .. " "
                        kind.menu = strings[2]
                        return kind
                    end,
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        local copilot_keys = vim.fn["copilot#Accept"]()
                        if copilot_keys ~= '' and type(copilot_keys) == "string" then
                            vim.api.nvim_feedkeys(copilot_keys, "i", true)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "copilot" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = 'buffer' },
                })
            },

            vim.diagnostic.config({
                virtual_text = true,
                underline = false,
                float = {
                    focusable = false,
                    border = "rounded",
                    style = "minimal",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            }))

        end
    },
}
