vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }, { confirm = false })
if vim.g.config and vim.g.config.fancy then
    vim.pack.add({ "https://github.com/mcauley-penney/visual-whitespace.nvim" }, { confirm = false })
    vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" }, { confirm = false })
end

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

if vim.g.config and vim.g.config.fancy then
    require("gitsigns").setup({
        numhl = false,
        signcolumn = true,
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "󰐊" },
            topdelete = { text = "󰐊" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
        },
    })
end
