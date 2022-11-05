local opts = { silent = true, noremap = true }

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
keymap("n", "<TAB>", ":bprev<cr>")
keymap("n", "<S-TAB>", ":bnext<cr>")

-- Navigation between Vim Windows
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Open Which Key Menu
keymap("n", "<Leader><Leader>", ":WhichKey<Leader><cr><Leader>")
keymap("v", "<Leader><Leader>", ":WhichKey<Leader><cr><Leader>")

-- Indent Selection
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Increment and Decrement a Number
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Yank, Delete and Paste from ThePrimeagen
keymap("n", "<Leader>y", '"+y')
keymap("v", "<Leader>y", '"+y')
keymap("n", "<Leader>Y", '"+Y')
keymap("n", "<Leader>d", '"+d')
keymap("v", "<Leader>d", '"+d')
keymap("x", "<Leader>p", '"_dP')

-- Delete Character without Copy it
keymap("n", "x", '"_x')

-- TODO: Which Key Transition

-- Basic
-- keymap("n", "f", ":Telescope find_files<cr>")
keymap("n", "e", ":NvimTreeToggle<cr>")
keymap("n", "c", ":bdelete<cr>")
keymap("n", "r", ":Jaq bang<cr>")
keymap("n", "sb", ":Telescope buffers<cr>")
-- keymap("n", "df", ":lua vim.lsp.buf.format { async = true }<cr>")

-- Diagnostic
keymap("n", "dl", ":lua vim.diagnostic.open_float()<cr>")
keymap("n", "dd", ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>")

-- Actions
keymap("n", "ai", ":lua vim.lsp.buf.hover()<cr>")

-- LazyGit
keymap("n", "gl", ":LazyGit<cr>")
