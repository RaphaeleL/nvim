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

-- Basic
keymap("n", "e", ":Telescope find_files<cr>")
keymap("n", "eb", ":Telescope file_browser<cr>")
keymap("n", "eg", ":Telescope live_grep<cr>")

keymap("n", "sb", ":Telescope buffers<cr>")
keymap("n", "sv", ":vsplit<cr>")
keymap("n", "sh", ":split<cr>")
keymap("n", "sc", ":close<cr>")

keymap("n", "c", ":bdelete<cr>")

-- Actions
keymap("n", "ai", ":lua vim.lsp.buf.hover()<cr>")
keymap("n", "<Leader>n", ":noh<cr>")

keymap("n", "su", ":UndotreeToggle<cr>")

keymap("n", "fo", ":foldopen<cr>")
keymap("n", "fc", ":foldclose<cr>")

keymap("n", "ff", ":lua vim.lsp.buf.format { async = true }<cr>")

keymap("n", "ds", ":Telescope lsp_document_symbols<cr>")

-- Git
keymap("n", "lg", ":LazyGit<cr>")
keymap("n", "gf", ":Telescope git_files<cr>")

-- Diagnostics
keymap("n", "da", ":lua vim.lsp.buf.code_action()<cr>")
keymap("n", "dr", ":lua vim.lsp.buf.references()<cr>")
keymap("n", "df", ":lua vim.lsp.buf.definition()<cr>")
keymap("n", "dc", ":lua vim.lsp.buf.declaration()<cr>")
keymap("n", "di", ":lua vim.lsp.buf.signature_help()<cr>")
keymap("n", "dl", ":lua vim.diagnostic.open_float()<cr>")
keymap("n", "db", ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>")
keymap("n", "dw", ":Telescope diagnostics<cr>")
