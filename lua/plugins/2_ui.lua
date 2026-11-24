require("nvim-treesitter.install").update("all")
require("nvim-treesitter.config").setup({
    install_dir = vim.fn.stdpath('data') .. '/site',
    ensure_installed = { "make", "c", "lua", "python" },
    sync_install = false,
    auto_install = false,
    indent = { enable = true },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
    },
})

vim.api.nvim_create_autocmd("UIEnter", {
    once = true,
    callback = function()
        vim.schedule(function()
            require("fidget").setup({})
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
        end)
    end
})
