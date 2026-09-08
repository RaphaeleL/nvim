local config = require("config")

-- nvim-treesitter must stay on the main branch (new API, no releases)
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }, { confirm = false })
if config.extras then
    vim.pack.add({ "https://github.com/mcauley-penney/visual-whitespace.nvim" }, { confirm = false })
end
if config.git then
    vim.pack.add({ { src = "https://github.com/lewis6991/gitsigns.nvim", version = vim.version.range("*") } }, { confirm = false })
end

if config.status then
    vim.pack.add({ "https://github.com/j-hui/fidget.nvim", }, { confirm = false })
end

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

if config.git then
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
