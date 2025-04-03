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

-- LSP Setup
vim.lsp.config("*", { -- Default LSP Settings for all LSP servers
    capabilities = require('blink.cmp').get_lsp_capabilities(),
    root_markers = { ".git" },
})
vim.diagnostic.config({ virtual_lines = false, virtual_text = false })
vim.lsp.enable({ "c", "lua", "python", "tailwind", 'typescript' })

