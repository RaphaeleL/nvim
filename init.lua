vim.loader.enable() -- builtin module cache, replaces impatient.nvim

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- User settings, validated and defaulted in lua/config.lua
vim.g.config = {
    theme       = "rose-pine", -- rose-pine || kanagawa || catppuccin || default
    statusline  = "minimal",   -- full || minimal || disabled
    transparent = false,       -- makes the color theme transparent, only works in rose-pine
    git         = true,        -- show git signs and enable the gitsigns plugin
    format      = true,        -- format the source code
    alignment   = true,        -- align selection with regex
    grugfar     = false,       -- search and replace
    lsp_status  = true,        -- fidget lsp status
    harpoon     = true,        -- extended navigation
}
