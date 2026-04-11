vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.config = {
    -- true || false
    fancy = false,
    -- rose-pine || kanagawa || catppuccin
    theme = "rose-pine",
    -- full || minimal || disabled
    statusline = "full"
}

require("plugins.utils")
require("plugins.ui")
require("plugins.theme")
require("plugins.explorer")
require("plugins.completion")
require("plugins.lsp")
