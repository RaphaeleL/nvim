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

-- +++++++++++++++++
-- + WHICHKEY      +
-- +++++++++++++++++

-- Basic
keymap("n", "<Leader>;", ":Alpha<cr>")
keymap("n", "<Leader>n", ":noh<cr>")
keymap("n", "<Leader>f", ":Telescope find_files<cr>")
-- keymap("n", "<Leader>x", ":Telescope file_browser<cr>")
keymap("n", "<Leader>e", ":NvimTreeToggle<cr>")
keymap("n", "<Leader>c", ":bdelete<cr>")
keymap("n", "<Leader>u", ":UndotreeToggle<cr>")
keymap("n", "<Leader>r", ":Jaq bang<cr>")
keymap("n", "<Leader>k", ":CommentToggle<cr>")

-- Buffer
keymap("n", "<Leader>bb", ":Telescope buffers<cr>")
keymap("n", "<Leader>bg", ":BufferGoto<cr>")
keymap("n", "<Leader>bn", ":BufferNext<cr>")
keymap("n", "<Leader>bp", ":BufferPrev<cr>")
keymap("n", "<Leader>bd", ":BufferDelete<cr>")
keymap("n", "<Leader>bk", ":BufferCloseallButCurrent<cr>")
keymap("n", "<Leader>bt", ":BufferPick<cr>")
keymap("n", "<Leader>bc", ":bdelete<cr>")
keymap("n", "<Leader>bv", ":vsplit<cr>")
keymap("n", "<Leader>bh", ":split<cr>")

-- Search
keymap("n", "<Leader>sg", ":Telescope grep_string<cr>")
keymap("n", "<Leader>sr", ":Telescope oldfiles<cr>")
keymap("n", "<Leader>st", ":Telescope live_grep<cr>")

-- Diagnostic
keymap("n", "<Leader>dr", ":lua vim.lsp.buf.rename()<cr>")
keymap("n", "<Leader>dl", ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>")
keymap("n", "<Leader>dp", ":lua vim.lsp.diagnostic.show_position_diagnostics()<cr>")
keymap("n", "<Leader>dd", ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>")
keymap("n", "<Leader>dw", ":Telescope diagnostic<cr>")
keymap("n", "<Leader>ds", ":Telescope lsp_document_symbols<cr>")
keymap("n", "<Leader>df", ":lua vim.lsp.buf.formatting()<cr>")
keymap("n", "<Leader>de", ":LspInfo<cr>")
keymap("n", "<Leader>do", ":LspInstallInfo<cr>")
keymap("n", "<Leader>dn", ":lua vim.lsp.diagnostic.goto_next()<cr>")
keymap("n", "<Leader>dN", ":lua vim.lsp.diagnostic.goto_prev()<cr>")

-- Actions
keymap("n", "<Leader>ac", ":lua vim.lsp.buf.declaration()<cr>")
keymap("n", "<Leader>aa", ":lua vim.lsp.buf.code_action()<cr>")
keymap("n", "<Leader>aR", ":lua vim.lsp.buf.references()<cr>")
keymap("n", "<Leader>aD", ":lua vim.lsp.buf.definition()<cr>")
keymap("n", "<Leader>ah", ":lua vim.lsp.buf.signature_help()<cr>")
keymap("n", "<Leader>aq", ":lua vim.diagnostic.setloclist()<cr>")
keymap("n", "<Leader>ai", ":lua vim.lsp.buf.implementation()<cr>")
keymap("n", "<Leader>aI", ":lua vim.lsp.buf.hover()<cr>")
keymap("n", "<Leader>as", ":Telescope lsp_document_symbols<cr>")
keymap("n", "<Leader>aS", ":Telescope lsp_dynamic_workspace_symbols<cr>")

-- Git
keymap("n", "<Leader>gs", ":Telescope git_status<cr>")
keymap("n", "<Leader>gc", ":Telescope git_commits<cr>")
keymap("n", "<Leader>gb", ":Telescope git_branches<cr>")
keymap("n", "<Leader>gd", ":Gitsigns diffthis HEAD<cr>")
keymap("n", "<Leader>ga", ":Gitsigns blame_line<cr>")
keymap("n", "<Leader>gl", ":Gitsigns toggle_signs<cr>")
keymap("n", "<Leader>gn", ":Gitsigns toggle_numhl<cr>")

-- Help
keymap("n", "<Leader>gh", ":lua require('telescope.builtin').help_tags()<cr>")
keymap("n", "<Leader>gk", ":Telescope keymaps<cr>")
keymap("n", "<Leader>gC", ":Telescope commands<cr>")
