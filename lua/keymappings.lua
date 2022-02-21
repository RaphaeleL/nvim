-- New Escape Key
vim.api.nvim_set_keymap("i", "ff", "<ESC>", {noremap=true, silent=true})

-- Delete word 
vim.api.nvim_set_keymap("n", "o", "dw", {noremap=true, silent=true})

-- Leader Key
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", {noremap=true, silent=true})
vim.g.mapleader = " "

-- Open Menu
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":WhichKey<Leader><CR><Leader>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>", ":WhichKey<Leader><CR><Leader>", {noremap=true, silent=true})

-- Indent Selection
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap=true, silent=true})
vim.api.nvim_set_keymap("v", ">", ">gv", {noremap=true, silent=true})

-- Navigate between Tabs
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bprev<CR>", {noremap=true, silent=true})

-- Navigation between Vim Windows
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap=true, silent=true})

-- Move Selection up and down
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", {noremap=true, silent=true})
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", {noremap=true, silent=true})

-- Close detached Windows (e. g.: Diagnostics)
vim.api.nvim_set_keymap("n", "qq", ":bd!<CR>", {noremap=true, silent=true})

-- Comment Selection 
vim.api.nvim_set_keymap("v", "<Leader>c", ":CommentToggle<CR>", {noremap=true, silent=true})





