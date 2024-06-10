return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local BORDER = false
            local lspconfig_settings = {}
            local border = {
                { "🭽", "FloatBorder" },
                { "▔", "FloatBorder" },
                { "🭾", "FloatBorder" },
                { "▕", "FloatBorder" },
                { "🭿", "FloatBorder" },
                { "▁", "FloatBorder" },
                { "🭼", "FloatBorder" },
                { "▏", "FloatBorder" },
            }

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls", "cssls", "eslint", "html", "jsonls", "lua_ls", "pyright", "pylsp", "rust_analyzer",
                    "tailwindcss", "taplo", "tsserver", "yamlls", "gopls"
                },
                handlers = {
                    function(server_name)
                        if BORDER == true then
                            vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
                            vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

                            local handlers = {
                                ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
                                ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
                            }

                            lspconfig_settings = { handlers = handlers }
                        end
                        require("lspconfig")[server_name].setup(lspconfig_settings)
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

            local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            local diagnostic_settings = {
                virtual_text = true,
                underline = false,
            }

            if BORDER then
                diagnostic_settings.float = {
                    focusable = true,
                    border = "rounded",
                    style = "minimal",
                    source = "always",
                    header = "",
                    prefix = "",
                }

                local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
                function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                    opts = opts or {}
                    opts.border = opts.border or border
                    return orig_util_open_floating_preview(contents, syntax, opts, ...)
                end

            end

            vim.diagnostic.config(diagnostic_settings)
        end
    },
}
