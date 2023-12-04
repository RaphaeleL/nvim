--------------------
-- Basic Settings --
--------------------
vim.cmd("syntax on")
vim.opt.fillchars = { eob = " " }
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.timeoutlen = 250
vim.opt.updatetime = 50
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.laststatus = 0
vim.opt.showcmd = false
vim.opt.signcolumn = "no"
vim.opt.wrap = true
vim.opt.shell = "/bin/bash"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.modifiable = true

-------------
-- Keymaps --
-------------
-- Buffer Manipulation
map("i", "kj", "<ESC>")
map("i", "jk", "<ESC>")
map("n", "<Space>", "<NOP>")
map("n", "q", ":q!<cr>")
map("n", "<TAB>", ":write<cr>:bprev<cr>")
map("n", "<S-TAB>", ":write<cr>:bnext<cr>")

map("n", "sh", "<C-w>h")
map("n", "sj", "<C-w>j")
map("n", "sk", "<C-w>k")
map("n", "sl", "<C-w>l")
map("n", "sv", ":vsplit<cr>")
map("n", "ss", ":split<cr>")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "<Leader>n", ":noh<cr>")

map("n", "<S-Up>", ":resize -2<CR>")
map("n", "<S-Down>", ":resize +2<CR>")
map("n", "<S-Left>", ":vertical resize -2<CR>")
map("n", "<S-Right>", ":vertical resize +2<CR>")

-- Char Manipulation
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

map("n", "<Leader>Y", '"+Y')
map("x", "<Leader>p", '"_dP')
map("n", "x", '"_x')
map("i", "<C-BS>", "<Esc>cvb")

-- Line Manipulation
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "k", "v:count == 0 ? 'gk' : 'k'")
map("n", "j", "v:count == 0 ? 'gj' : 'j'")

map({ "n", "v" }, "<Leader>l", ":CommentToggle<cr>")

map("n", "<C-a>", "GVgg")
map("n", "J", "mzJ`z")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "H", "0")
map("n", "L", "$")

-- File System 
map("n", "<leader>e", ":NvimTreeToggle<cr>")

--------------------
-- Plugin Manager --
--------------------
require "plugins"
