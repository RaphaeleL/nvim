config = function()
    require("vague").setup({
        transparent = true
    })
end

require("rose-pine").setup({
    variant = "auto",
    dark_variant = "moon",
    dim_inactive_windows = true,
    extend_background_behind_borders = true,
    dim_nc_background = true,
    disable_background = true,
    styles = {
        bold = true,
        italic = true,
        transparency = true,
    },
    groups = {},
    highlight_groups = {
        Normal = { bg = "NONE" },
        NormalNC = { bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        StatusLine = { bg = "NONE" },
        StatusLineNC = { bg = "NONE" },
        CursorLineNr = { fg = "gold" },
    },
})

vim.cmd("colorscheme vague")
vim.cmd("hi statusline guibg=NONE")
