local opts = { silent = true } --, noremap = true }

local function keymap(mode, old, new)
	vim.api.nvim_set_keymap(mode, old, new, opts)
end

-- New Escape Key
keymap("i", "kj", "<ESC>")
keymap("i", "jk", "<ESC>")

-- Leader Key
keymap("n", "<Space>", "<NOP>")
vim.g.mapleader = " "

-- Navigate between Tabs
keymap("n", "<TAB>", ":bprev<CR>")
keymap("n", "<S-TAB>", ":bnext<CR>")

-- Navigation between Vim Windows
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Open Which Key Menu
keymap("n", "<Leader><Leader>", ":WhichKey<Leader><CR><Leader>")
keymap("v", "<Leader><Leader>", ":WhichKey<Leader><CR><Leader>")

-- Indent Selection
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move Selection up and down
keymap("x", "J", ":move '>+2<CR>gv-gv")
keymap("x", "K", ":move '<-1<CR>gv-gv")

-- Increment and Decrement a Number
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Delete a Word backwards
keymap("n", "dwb", 'vb"_d')
