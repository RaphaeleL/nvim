return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "folke/neodev.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local on_attach = function(_, bufnr)
                local nmap = function(keys, func, desc)
                    if desc then desc = " LSP: " .. desc end
                    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
                end
                nmap("ca", ":lua vim.lsp.buf.code_action()<cr>", "[C]ode [A]ction")
                nmap("sd", ":lua vim.diagnostic.open_float()<cr>", "[O]pen [D]iagnostics")
                nmap("gr", ":lua vim.lsp.buf.references()<cr>", "[G]oto [R]eference")
                nmap("gd", ":lua vim.lsp.buf.definition()<cr>", "[G]oto [D]efinition")
                nmap("gn", ":lua vim.diagnostic.goto_next()<cr>zz", "[G]oto [N]ext Diagnostic")
                nmap("gp", ":lua vim.diagnostic.goto_prev()<cr>zz", "[G]oto [P]revious Diagnostic")
                nmap("K", ":lua vim.lsp.buf.hover()<cr>", "Hover Documentation")
                nmap("FF", ":lua vim.lsp.buf.format()<cr>", "[F]ormat [F]ile")
            end

            local servers = { }

            require("neodev").setup()

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            require("mason").setup()

            local mason_lspconfig = require "mason-lspconfig"

            mason_lspconfig.setup {
                ensure_installed = vim.tbl_keys(servers),
            }

            mason_lspconfig.setup_handlers {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = servers[server_name],
                    }
                end,

            }

            local cmp = require("cmp")
            local luasnip = require("luasnip")

            luasnip.config.setup({})

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert {
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete {},
                    ["<CR>"] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                sources = {
                    { name = "copilot",  group_index = 2 },
                    { name = "nvim_lsp", group_index = 2 },
                    { name = "luasnip",  group_index = 2 },
                },
            }

            local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                -- numhl = numhl to color linenumbers ---------------------vvv--
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = nil })
            end

            vim.diagnostic.config({
                virtual_text = false,
                underline = false,
                -- virtual_text = {
                --     source = "always",
                -- },
                float = {
                    source = "always",
                },
            })
        end,
    },
}
