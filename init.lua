-- Set Leader to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap the Plugin Manager
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.uv.fs_stat(lazypath) then
--     vim.fn.system({
--         "git",
--         "clone",
--         "--filter=blob:none",
--         "--single-branch",
--         "https://github.com/folke/lazy.nvim.git",
--         lazypath,
--     })
-- end
-- vim.opt.runtimepath:prepend(lazypath)
-- require("lazy").setup({ import = "plugins" }, { change_detection = { notify = false } })

-- reset packpath to sane defaults (you broke it by pointing at /start/)
vim.opt.packpath = table.concat({
  vim.fn.stdpath("data") .. "/site",
  vim.fn.stdpath("config") .. "/site",
  "/usr/local/share/nvim/site",
  "/usr/share/nvim/site",
}, ",")

