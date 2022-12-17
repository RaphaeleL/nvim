local lsp = require('lsp-zero')

lsp.preset('recommended')

vim.diagnostic.config({ virtual_text = true })

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.setup()
