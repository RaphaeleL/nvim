-- Krait: syntax files live in ~/.config/nvim/krait (copied from editors/vim)
vim.opt.runtimepath:append(vim.fn.stdpath("config") .. "/krait")
vim.filetype.add({ extension = { krt = "krait" } })

-- Krait language server
vim.lsp.config("krait", {
    cmd = { "krait", "--lsp" },
    filetypes = { "krait" },
    root_markers = { "modules", ".git" },
})
vim.lsp.enable("krait")
