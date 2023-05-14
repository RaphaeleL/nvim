return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            { "neovim/nvim-lspconfig" },
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },

            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
            { "j-hui/fidget.nvim",                opts = {} },

        },
        config = function()
            local lsp = require("lsp-zero").preset({})

            lsp.on_attach(function(client, bufnr)
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
            end)

            require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()
        end
    }
}
