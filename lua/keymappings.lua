-- New Escape Key
vim.api.nvim_set_keymap("i", "kj", "<ESC>", {silent=true})
vim.api.nvim_set_keymap("i", "jk", "<ESC>", {silent=true})

-- Quick Close  
vim.api.nvim_set_keymap("n", "zZ", ":qa!<CR>", {noremap=true, silent=true})

-- Delete word
vim.api.nvim_set_keymap("n", "o", "dw", {noremap=true, silent=true})

-- Leader Key
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", {noremap=true, silent=true})
vim.g.mapleader = " "
-- Navigate between Tabs
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bprev<CR>", {noremap=true, silent=true})

-- Navigation between Vim Windows
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap=true, silent=true})

-- Close detached Windows (e. g.: Diagnostics)
vim.api.nvim_set_keymap("n", "qq", ":bd!<CR>", {noremap=true, silent=true})

-- Open Menu
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":WhichKey<Leader><CR><Leader>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>", ":WhichKey<Leader><CR><Leader>", {noremap=true, silent=true})

-- Indent Selection
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap=true, silent=true})
vim.api.nvim_set_keymap("v", ">", ">gv", {noremap=true, silent=true})

-- Comment Selection
vim.api.nvim_set_keymap("v", "<Leader>c", ":CommentToggle<CR>", {noremap=true, silent=true})
vim.api.nvim_buf_set_option(0, "commentstring", "# %s")

-- Move Selection up and down
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", {noremap=true, silent=true})
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", {noremap=true, silent=true})
