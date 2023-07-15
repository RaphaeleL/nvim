vim.opt.fillchars = { eob = " " }
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
-- vim.opt.termguicolors = true
vim.opt.timeoutlen = 250
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.laststatus = 0
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- vim.opt.guifont = "SF Mono:h14"
vim.opt.fillchars.eob = " "
vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.shell = "/bin/zsh"
vim.opt.relativenumber = true
vim.opt.modifiable = true
vim.opt.autochdir = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.g.neovide then
    vim.cmd("cd ~/")
    vim.opt.linespace = 0
    vim.opt.guifont = "SF Mono NF:h14"
    vim.g.remember_window_size = true
    vim.g.remember_window_position = true
    vim.g.neovide_cursor_antialiasing = true
    vim.opt.guifont = { "SF Mono", ":h14" }
    vim.g.neovide_transparency = 0.0
    vim.g.transparency = 1 -- 0.95
    vim.g.neovide_background_color = "#1e1e1e" .. string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end
