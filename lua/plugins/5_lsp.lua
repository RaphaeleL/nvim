vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" }, { confirm = false })
vim.pack.add({ { src = "https://github.com/mason-org/mason.nvim", version = vim.version.range("2.*") } }, { confirm = false })
vim.pack.add({ { src = "https://github.com/mason-org/mason-lspconfig.nvim", version = vim.version.range("2.*") } }, { confirm = false })
vim.pack.add({ "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" }, { confirm = false })

require("mason").setup()
require("mason-tool-installer").setup({
    ensure_installed = {
        -- C / C++ ecosystem
        "clangd",                         -- C / C++ LSP
        "codelldb",                       -- C / C++ / Rust debugger (LLDB)
        "neocmake",                       -- CMake LSP
        "cpplint",                        -- C / C++ linting

        -- Systems
        "rust-analyzer",                  -- Rust LSP

        -- Scripting / general purpose
        "lua-language-server",            -- Lua LSP
        "pyright",                        -- Python LSP

        -- Web
        "typescript-language-server",     -- JavaScript / TypeScript LSP
        "html-lsp",                       -- HTML LSP
        "css-lsp",                        -- CSS / SCSS LSP

        -- Configuration / project files
        "yaml-language-server",           -- YAML LSP
        "json-lsp",                       -- JSON LSP
        "taplo",                          -- TOML LSP
        "dockerfile-language-server",     -- Dockerfile LSP

        -- Shell
        "bash-language-server",           -- Bash / Shell LSP
        "shellcheck",                     -- Bash / Shell linting

        -- Documentation
        "marksman",                       -- Markdown LSP

        -- C / C++ formatting & tooling
        "clang-format",                   -- C / C++ formatting
        "cmakelang",                      -- CMake formatting / linting

        -- Other formatting
        "shfmt",                          -- Shell formatting
        "stylua",                         -- Lua formatting
    },
    run_on_start = true,
    start_delay = 3000,
})

-- see `:h lspconfig-all` for available servers and their settings
local lsp_servers = {
    clangd = {},
    neocmake = {},
    lua_ls = {
        settings = {
            Lua = {
                workspace = {
                    library = vim.api.nvim_get_runtime_file("lua", true),
                },
            },
        },
    },
    pyright = {},
    ts_ls = {},
    html = {},
    cssls = {},
    yamlls = {},
    taplo = {},
    bashls = {},
    dockerls = {},
    marksman = {},
}

for server, config in pairs(lsp_servers) do
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
end

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.HINT] = "H",
        },
    },
    virtual_text = true,
})

