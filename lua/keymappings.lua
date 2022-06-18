local opts = { silent = true, noremap = true }

local function keymap(mode, old, new)
	vim.api.nvim_set_keymap(mode, old, new, opts)
end

-- New Escape Key
vim.api.nvim_set_keymap("i", "kj", "<ESC>", { silent = true })
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { silent = true })

-- Delete word
keymap("n", "o", "dw")

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

-- Close detached Windows (e. g.: Diagnostics)
keymap("n", "qq", ":bd!<CR>")

-- Open Menu
keymap("n", "<Leader><Leader>", ":WhichKey<Leader><CR><Leader>")
keymap("v", "<Leader><Leader>", ":WhichKey<Leader><CR><Leader>")

-- Indent Selection
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move Selection up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")

-- WHICH KEY KEYMAPS
-- keymap("n", "<Space>e", ":NvimTreeToggle<cr>")
-- keymap("n", "<Space>s", ":Telescope find_files<cr>")
-- keymap("n", "<Space>n", ":noh<cr>")
-- keymap("n", "<Space>c", ":bdelete<cr>")
-- keymap("n", "<Space>;", ":Alpha<cr>")
-- keymap("n", "<Space>h", ":lua require('telescope.builtin').help_tags()<cr>")
-- keymap("n", "<Space>U", ":UndotreeToggle<cr>")
-- keymap("n", "fg", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<cr>")
-- keymap("n", "fb", ":lua require('telescope.builtin').buffers()<cr>")
-- keymap("n", "fw", ":Autoformat<cr>")
-- keymap("n", "fl", ":AutoformatLine<cr>")
-- keymap("n", "ff", ":RemoveTrailingSpaces<cr>")
-- keymap("n", "dD", ":lua vim.lsp.buf.definition()<cr>")
-- keymap("n", "di", ":lua vim.lsp.buf.implementation()<cr>")
-- keymap("n", "dr", ":lua vim.lsp.buf.rename()<cr>")
-- keymap("n", "dI", ":lua vim.lsp.buf.hover()<cr>")
-- keymap("n", "dn", ":lua vim.lsp.diagnostic.goto_next()<cr>")
-- keymap("n", "dN", ":lua vim.lsp.diagnostic.goto_prev()<cr>")
-- keymap("n", "dl", ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>")
-- keymap("n", "dp", ":lua vim.lsp.diagnostic.show_position_diagnostics()<cr>")
-- keymap("n", "tt", ":ToggleTerm direction=float<cr>")
-- keymap("n", "tb", ":ToggleTerm<cr>")
-- keymap("n", "ab", ":call append(line('.'), '')<cr>")
-- keymap("n", "aa", ":call append(line('.')-1, '')<cr>")
-- keymap("n", "gg", ":Copilot panel<cr>")
-- keymap("n", "gl", ":Gitsigns toggle_signs<cr>")
-- keymap("n", "gs", ":Telescope git_status<cr>")
-- keymap("n", "gc", ":Telescope git_commits<cr>")
-- keymap("n", "gb", ":Telescope git_branches<cr>")
