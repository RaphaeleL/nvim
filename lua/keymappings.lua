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

-- -- +++++++++++++++++
-- -- + WHICHKEY      +
-- -- +++++++++++++++++

-- -- Basic
-- keymap("n", "<Leader>;", ":Alpha<cr>")
-- keymap("n", "<Leader>n", ":noh<cr>")
-- keymap("n", "<Leader>f", ":Telescope find_files<cr>")
-- keymap("n", "<Leader>e", ":NvimTreeToggle<cr>")
-- keymap("n", "<Leader>c", ":bdelete<cr>")
-- keymap("n", "<Leader>u", ":UndotreeToggle<cr>")
-- keymap("n", "<Leader>r", ":Jaq bang<cr>")
-- keymap("n", "<Leader>b", ":Telescope buffers<cr>")
-- keymap("n", "<Leader>g", ":Telescope live_grep<cr>")
--
-- -- Buffer
-- keymap("n", "bc", ":bdelete<cr>")
-- keymap("n", "bv", ":vsplit<cr>")
-- keymap("n", "bh", ":split<cr>")
--
-- -- Diagnostic
-- keymap("n", "dr", ":lua vim.lsp.buf.rename()<cr>")
-- keymap("n", "dl", ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>")
-- keymap("n", "dp", ":lua vim.lsp.diagnostic.show_position_diagnostics()<cr>")
-- keymap("n", "dd", ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>")
-- keymap("n", "ds", ":Telescope lsp_document_symbols<cr>")
-- keymap("n", "df", ":lua vim.lsp.buf.formatting()<cr>")
-- keymap("n", "dn", ":lua vim.lsp.diagnostic.goto_next()<cr>")
-- keymap("n", "dN", ":lua vim.lsp.diagnostic.goto_prev()<cr>")
--
-- -- Actions
-- keymap("n", "ac", ":lua vim.lsp.buf.declaration()<cr>")
-- keymap("n", "aa", ":lua vim.lsp.buf.code_action()<cr>")
-- keymap("n", "aR", ":lua vim.lsp.buf.references()<cr>")
-- keymap("n", "aD", ":lua vim.lsp.buf.definition()<cr>")
-- keymap("n", "ah", ":lua vim.lsp.buf.signature_help()<cr>")
-- keymap("n", "aq", ":lua vim.diagnostic.setloclist()<cr>")
-- keymap("n", "ai", ":lua vim.lsp.buf.implementation()<cr>")
-- keymap("n", "aI", ":lua vim.lsp.buf.hover()<cr>")
-- keymap("n", "aS", ":Telescope lsp_dynamic_workspace_symbols<cr>")
--
-- -- Git
-- keymap("n", "gs", ":Telescope git_status<cr>")
-- keymap("n", "gc", ":Telescope git_commits<cr>")
-- keymap("n", "gb", ":Telescope git_branches<cr>")
-- keymap("n", "gd", ":Gitsigns diffthis HEAD<cr>")
-- keymap("n", "ga", ":Gitsigns blame_line<cr>")
--
-- -- Help
-- keymap("n", "gh", ":lua require('telescope.builtin').help_tags()<cr>")
-- keymap("n", "gk", ":Telescope keymaps<cr>")
-- keymap("n", "gc", ":Telescope commands<cr>")
