vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.config = {
    fancy = false,          -- true || false
    theme = "rose-pine",    -- rose-pine || kanagawa || catppuccin
    statusline = "disabled" -- full || minimal || disabled
}

require("plugins.utils")
require("plugins.ui")
require("plugins.theme")
require("plugins.explorer")
require("plugins.completion")
require("plugins.lsp")
