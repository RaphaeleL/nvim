-- Addo: syntax files live in ~/.config/nvim/ardo (copied from editors/vim)
vim.opt.runtimepath:append(vim.fn.stdpath("config") .. "/ardo")
vim.filetype.add({ extension = { ardo = "ardo" } })

-- Ardo language server
vim.lsp.config("ardo", {
    cmd = { "ardo", "--lsp" },
    filetypes = { "ardo" },
    root_markers = { "modules", ".git" },
})
vim.lsp.enable("ardo")

-- Ardo treesitter
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ardo",
  callback = function(ev) vim.treesitter.start(ev.buf, "ardo") end,
})
