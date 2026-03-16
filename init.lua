vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.config = {
    fancy = false,      -- true or false
    theme = "rose-pine" -- rose-pine or kanagawa or catppuccin
}

require("plugins.utils")
require("plugins.ui")
require("plugins.theme")
require("plugins.explorer")
require("plugins.completion")
require("plugins.lsp")
