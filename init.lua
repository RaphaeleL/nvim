-- if vim.fn.has("nvim-0.11") == 0 then
--     vim.notify("This Configuration only supports Neovim 0.11+", vim.log.levels.ERROR)
--     return
-- end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.runtimepath:prepend(lazypath)
require("lazy").setup({ import = "plugins" }, { change_detection = { notify = false } })

require("core.lsp")
