-- Highlight Yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

-- Open NvimTree in Nvim Folder View (e.g. nvim .)
vim.cmd [[
  augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'cd '.argv()[0] | exe 'NvimTreeOpen' | wincmd p | ene | exe 'cd '.getcwd() | endif
  augroup END
]]
