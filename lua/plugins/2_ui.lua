require("fidget").setup({})
require("nvim-treesitter.install").update("all")
require("nvim-treesitter.config").setup({
    install_dir = vim.fn.stdpath('data') .. '/site',
    ensure_installed = { "make", "c", "lua", "python" },
    sync_install = true,
    auto_install = true,
    indent = { enable = true },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
    },
})

require("gitsigns").setup({
    numhl = false,
    signcolumn = true,
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
        topdelete = { text = "-" },
        changedelete = { text = "-" },
        untracked = { text = "+" },
    },
})
