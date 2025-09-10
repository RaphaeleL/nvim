-- Lua
vim.lsp.config.lua_ls = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".git", "init.lua"},
    settings = {
        Lua = {
            telemetry = {
                enable = false,
            },
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
}
vim.lsp.enable("lua_ls")
