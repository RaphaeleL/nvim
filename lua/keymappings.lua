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
keymap("n", "m", ":CybuNext<cr>")
keymap("n", "M", ":CybuPrev<cr>")

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

-- TODO: Which Key Transition

-- Harpoon
keymap("n", ",", ':lua require("harpoon.ui").nav_next()<cr>')
keymap("n", ";", ':lua require("harpoon.ui").nav_prev()<cr>')
keymap("n", "ha", ':lua require("harpoon.mark").add_file()<cr>')
keymap("n", "hs", ':lua require("harpoon.ui").toggle_quick_menu()<cr>')

-- Basic
keymap("n", "s", ":wa!<cr>")
keymap("n", "f", ":Telescope find_files<cr>")
keymap("n", "e", ":NvimTreeToggle<cr>")
keymap("n", "c", ":bdelete<cr>")
keymap("n", "r", ":Jaq bang<cr>")
keymap("n", "sb", ":Telescope buffers<cr>")
keymap("n", "df", ":lua vim.lsp.buf.formatting()<cr>")

-- Diagnostic
keymap("n", "dl", ":lua vim.diagnostic.open_float()<cr>")

-- Actions
keymap("n", "ai", ":lua vim.lsp.buf.hover()<cr>")
