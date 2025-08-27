-- Set Leader to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap the Plugin Manager
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

-- reset packpath to sane defaults (you broke it by pointing at /start/)
vim.opt.packpath = table.concat({
  vim.fn.stdpath("data") .. "/site",
  vim.fn.stdpath("config") .. "/site",
  "/usr/local/share/nvim/site",
  "/usr/share/nvim/site",
}, ",")

-- plugin in start/ is auto-loaded; just require it
-- require("vague").setup({})
-- require("solarized-osaka").setup({})
-- vim.cmd("colorscheme vague")
--
require('copilot').setup({
        suggestion = {
            enabled = not true,
            auto_trigger = true,
            hide_during_completion = false,
            keymap = {
                accept = "<M-l>",
                next = "<M-n>",
                prev = "<M-p>",
            },
        },
        panel = { enabled = not true },
        filetypes = {
            markdown = true,
            yaml = true,
            help = true,
        },
    })
