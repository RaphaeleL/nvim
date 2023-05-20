return {
    -- ========================================
    --      Own LSP Configuration
    -- ========================================
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
            { "j-hui/fidget.nvim", opts = {} },
        },
        config = function()
            local on_attach = function(client, bufnr)
                local nmap = function(keys, func, desc)
                    if desc then desc = "(NaaVim) LSP: " .. desc end
                    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
                end
                nmap("ca", ":lua vim.lsp.buf.code_action()<cr>", "[C]ode [A]ction")
                nmap("sd", ":lua vim.diagnostic.open_float()<cr>", "[O]pen [D]iagnostics")
                nmap("gr", ":lua vim.lsp.buf.references()<cr>", "[G]oto [R]eference")
                nmap("gd", ":lua vim.lsp.buf.definition()<cr>", "[G]oto [D]efinition")
                nmap("gn", ":lua vim.diagnostic.goto_next()<cr>zz", "[G]oto [N]ext Diagnostic")
                nmap("gp", ":lua vim.diagnostic.goto_prev()<cr>zz", "[G]oto [P]revious Diagnostic")
                nmap("K", ":lua vim.lsp.buf.hover()<cr>", "Hover Documentation")
                nmap("<leader>k", ":lua vim.lsp.buf.signature_help()<cr>", "Signature Documentation")
                nmap("ff", ":lua vim.lsp.buf.format()<cr>", "[F]ormat [F]ile")
            end

            local servers = {
                lua_ls = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            }

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

            vim.diagnostic.config({
                virtual_text = false,
                underline = false
            })
        end,
    },
    -- ========================================
    --      LSP-Zero v2.x
    -- ========================================
    -- {
    --     "VonHeikemen/lsp-zero.nvim",
    --     branch = "v2.x",
    --     dependencies = {
    --         { "neovim/nvim-lspconfig" },
    --         {
    --             "williamboman/mason.nvim",
    --             build = function()
    --                 pcall(vim.cmd, "MasonUpdate")
    --             end,
    --         },
    --         { "williamboman/mason-lspconfig.nvim" },
    --
    --         { "hrsh7th/nvim-cmp" },
    --         { "hrsh7th/cmp-nvim-lsp" },
    --         { "L3MON4D3/LuaSnip" },
    --         { "j-hui/fidget.nvim", opts = {} },
    --
    --     },
    --     config = function()
    --         local lsp = require("lsp-zero").preset({})
    --
    --         lsp.on_attach(function(client, bufnr)
    --             local nmap = function(keys, func, desc)
    --                 if desc then desc = "(NaaVim) LSP: " .. desc end
    --                 vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    --             end
    --             nmap("ca", ":lua vim.lsp.buf.code_action()<cr>", "[C]ode [A]ction")
    --             nmap("sd", ":lua vim.diagnostic.open_float()<cr>", "[O]pen [D]iagnostics")
    --             nmap("gr", ":lua vim.lsp.buf.references()<cr>", "[G]oto [R]eference")
    --             nmap("gd", ":lua vim.lsp.buf.definition()<cr>", "[G]oto [D]efinition")
    --             nmap("gn", ":lua vim.diagnostic.goto_next()<cr>zz", "[G]oto [N]ext Diagnostic")
    --             nmap("gp", ":lua vim.diagnostic.goto_prev()<cr>zz", "[G]oto [P]revious Diagnostic")
    --             nmap("K", ":lua vim.lsp.buf.hover()<cr>", "Hover Documentation")
    --             nmap("<leader>k", ":lua vim.lsp.buf.signature_help()<cr>", "Signature Documentation")
    --             nmap("ff", ":lua vim.lsp.buf.format()<cr>", "[F]ormat [F]ile")
    --         end)
    --
    --         require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
    --
    --         lsp.setup()
    --     end
    -- }
    -- ========================================
    --      LSP-Zero v1.x
    -- ========================================
    -- {
    --     "VonHeikemen/lsp-zero.nvim",
    --     event = "VeryLazy",
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --         "williamboman/mason-lspconfig.nvim",
    --         "neovim/nvim-lspconfig",
    --         "hrsh7th/nvim-cmp",
    --         "hrsh7th/cmp-buffer",
    --         "hrsh7th/cmp-path",
    --         "hrsh7th/cmp-nvim-lsp",
    --         "L3MON4D3/LuaSnip",
    --         "rafamadriz/friendly-snippets",
    --     },
    --     config = function()
    --         local ok, lsp = pcall(require, "lsp-zero")
    --         if not ok then
    --             require("notify")("Couldn"t require lsp-zero", "error")
    --             return
    --         end
    --
    --         lsp.preset("recommended")
    --
    --         -- lsp.set_preferences({
    --         --     suggest_lsp_servers = false,
    --         --     sign_icons = {
    --         --         error = "E",
    --         --         warn = "W",
    --         --         hint = "H",
    --         --         info = "I"
    --         --     }
    --         -- })
    --
    --         -- lsp.ensure_installed({
    --         --     "tsserver", "eslint", "luals",
    --         --     "rust_analyzer", "bashls", "clangd",
    --         --     "cmake", "jsonls", "marksman",
    --         --     "pyright", "yamlls",
    --         -- })
    --
    --         lsp.configure("lua-language-server", {
    --             settings = {
    --                 Lua = {
    --                     diagnostics = {
    --                         globals = { "vim" }
    --                     }
    --                 }
    --             }
    --         })
    --
    --         lsp.on_attach(function(_, bufnr)
    --             local nmap = function(keys, func, desc)
    --                 if desc then desc = "(NaaVim) LSP: " .. desc end
    --                 vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    --             end
    --
    --             nmap("ca", ":lua vim.lsp.buf.code_action()<cr>", "(NaaVim) [C]ode [A]ction")
    --             nmap("sd", ":lua vim.diagnostic.open_float()<cr>", "(NaaVim) [O]pen [D]iagnostics")
    --             nmap("gr", ":lua vim.lsp.buf.references()<cr>", "(NaaVim) [G]oto [R]eference")
    --             nmap("gd", ":lua vim.lsp.buf.definition()<cr>", "(NaaVim) [G]oto [D]efinition")
    --             nmap("gn", ":lua vim.diagnostic.goto_next()<cr>zz", "(NaaVim) [G]oto [N]ext Diagnostic")
    --             nmap("gp", ":lua vim.diagnostic.goto_prev()<cr>zz", "(NaaVim) [G]oto [P]revious Diagnostic")
    --             nmap("K", ":lua vim.lsp.buf.hover()<cr>", "(NaaVim) Hover Documentation")
    --             nmap("<leader>k", ":lua vim.lsp.buf.signature_help()<cr>", "(NaaVim) Signature Documentation")
    --             nmap("ff", function()
    --                 vim.cmd("silent LspZeroFormat!")
    --                 vim.cmd("lua require("notify")("Format File Async with lsp-zero", "Info")")
    --             end, "(NaaVim) [F]ormat [F]ile")
    --         end)
    --
    --         lsp.setup()
    --
    --         vim.diagnostic.config({
    --             virtual_text = false,
    --             underline = false
    --         })
    --     end,
    -- },
}
