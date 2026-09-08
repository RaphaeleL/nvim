vim.loader.enable() -- builtin module cache, replaces impatient.nvim

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- User settings, validated and defaulted in lua/config.lua
vim.g.config = {
    theme = "rose-pine",     -- rose-pine || kanagawa || catppuccin || default
    statusline = "disabled", -- full || minimal || disabled
    git = false,             -- gitsigns.nvim
    format = false,          -- conform.nvim + format keymaps
    extras = false,          -- visual-surround, grug-far, visual-whitespace
    status = true,           -- lsp fidget status
}

require("plugins.utils")
require("plugins.ui")
require("plugins.theme")
require("plugins.explorer")
require("plugins.completion")
require("plugins.lsp")
