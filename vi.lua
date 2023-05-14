--------------------
-- Basic Settings --
--------------------
vim.cmd("syntax on")
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
vim.keymap.set("n", "<S-TAB>", ":write<cr>:bnext<cr>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "sv", ":vsplit<cr>")
vim.keymap.set("n", "sh", ":split<cr>")
vim.keymap.set("n", "c", ":close!<cr>")
vim.keymap.set("n", "q", ":bdelete!<cr>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<Leader>n", ":noh<cr>")

-- Char Manipulation
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", ":!chmod +x %<cr>")
vim.keymap.set("n", "<leader>cc", ":! make -j4")
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")
vim.keymap.set("n", "<Leader>Y", '"+Y')
vim.keymap.set("x", "<Leader>p", '"_dP')
vim.keymap.set("n", "x", '"_x')

-- Line Manipulation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true})
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true})
vim.keymap.set({ "n", "v" }, "<Leader>l", ":CommentToggle<cr>")
vim.keymap.set("n", "<leader>a", "GVgg")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

--------------------
-- Plugin Manager --
--------------------
-- require "plugins"
