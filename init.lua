vim.loader.enable() -- builtin module cache, replaces impatient.nvim

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- User settings, validated and defaulted in lua/config.lua
vim.g.config = {
    theme       = "rose-pine",  -- rose-pine || kanagawa || catppuccin || default
    transparent = false,        -- makes the color theme transparent, only works in rose-pine
    statusline  = "minimal",    -- full || minimal || disabled
    git         = not false,    -- gitsigns.nvim
    format      = false,        -- conform.nvim + format keymaps
    extras      = false,        -- visual-surround, grug-far, visual-whitespace, align
    status      = true,         -- lsp fidget status
    extended_fs = true,         -- harpoon2
}
