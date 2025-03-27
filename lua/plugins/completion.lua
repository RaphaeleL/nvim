return {
    'saghen/blink.cmp',
    event = { "InsertEnter" },
    dependencies = {
        'rafamadriz/friendly-snippets',
    },
    version = '*',
    opts = {
        keymap = { preset = "enter", },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        signature = {enabled = true},
        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
            },
        },
    },
}
