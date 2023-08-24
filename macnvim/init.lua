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
vim.g.mapleader = " "

-- Buffer Manipulation
vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<Space>", "<NOP>")
vim.keymap.set("n", "<C-s>", ":wa!<cr>")
vim.keymap.set("n", "<C-w>", ":wqa!<cr>")
vim.keymap.set("n", "<TAB>", ":write<cr>:bprev<cr>")
vim.keymap.set("n", "<leader>bn", ":write<cr>:bprev<cr>")
vim.keymap.set("n", "<S-TAB>", ":write<cr>:bnext<cr>")
vim.keymap.set("n", "<leader>bp", ":write<cr>:bnext<cr>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>bv", ":vsplit<cr>")
vim.keymap.set("n", "<leader>bh", ":split<cr>")
vim.keymap.set("n", "<leader>bq", ":bdelete!<cr>")
vim.keymap.set("n", "c", ":close!<cr>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<Leader>n", ":noh<cr>")
vim.keymap.set("n", "<S-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<S-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>")

-- Char Manipulation
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>c", ":! make -j4")
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")
vim.keymap.set("n", "<Leader>Y", '"+Y')
vim.keymap.set("x", "<Leader>p", '"_dP')
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("i", "<C-BS>", "<Esc>cvb")

-- Line Manipulation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'")
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'")
vim.keymap.set({ "n", "v" }, "<Leader>l", ":CommentToggle<cr>")
vim.keymap.set("n", "<leader>ba", "GVgg")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "H", "0")
vim.keymap.set("n", "L", "$")

-- File System 
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")

--------------------
-- Plugin Manager --
--------------------
require "plugins"
