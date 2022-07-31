vim.opt.backup = false
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.timeoutlen = 100
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17"
vim.opt.shortmess:append("c")

vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])

-- -- NEOVIDE
-- vim.cmd([[set guifont="DroidSansMono Nerd Fonts"]])
-- vim.g.gui_font_default_size = 12
-- vim.g.gui_font_size = vim.g.gui_font_default_size
-- vim.g.gui_font_face = "Cascadia Code"
--
-- RefreshGuiFont = function()
-- 	vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
-- end
-- ResizeGuiFont = function(delta)
-- 	vim.g.gui_font_size = vim.g.gui_font_size + delta
-- 	RefreshGuiFont()
-- end
-- ResetGuiFont = function()
-- 	vim.g.gui_font_size = vim.g.gui_font_default_size
-- 	RefreshGuiFont()
-- end
-- ResetGuiFont()
-- vim.keymap.set({ "n", "i" }, "<C-+>", function()
-- 	ResizeGuiFont(1)
-- end, { noremap = true, silent = true })
-- vim.keymap.set({ "n", "i" }, "<C-->", function()
-- 	ResizeGuiFont(-1)
-- end, { noremap = true, silent = true })
