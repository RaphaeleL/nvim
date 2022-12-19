-- The Keymaps are distributed over the entire Configuration.
-- for example, there are Keymaps for lsp in the lsp file.

vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<Space>", "<NOP>")
vim.g.mapleader = " "

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "sv", ":vsplit<cr>")
vim.keymap.set("n", "sh", ":split<cr>")
vim.keymap.set("n", "sc", ":close<cr>")
vim.keymap.set("n", "c", ":bdelete<cr>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<TAB>", ":bprev<cr>")
vim.keymap.set("n", "<S-TAB>", ":bnext<cr>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<Leader>n", ":noh<cr>")
vim.keymap.set("n", "su", ":UndotreeToggle<cr>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", ":!chmod +x %<cr>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")
vim.keymap.set("n", "<Leader>Y", '"+Y')
vim.keymap.set("n", "<Leader>d", '"+d')
vim.keymap.set("v", "<Leader>d", '"+d')
vim.keymap.set("x", "<Leader>p", '"_dP')
vim.keymap.set("n", "x", '"_x')
