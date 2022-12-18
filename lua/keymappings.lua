local opts = { silent = true, noremap = true }

local function nmap(old, new) vim.api.nvim_set_keymap("n", old, new, opts) end

local function vmap(old, new) vim.api.nvim_set_keymap("v", old, new, opts) end

local function imap(old, new) vim.api.nvim_set_keymap("i", old, new, opts) end

local function xmap(old, new) vim.api.nvim_set_keymap("x", old, new, opts) end

-- New Escape Key
imap("kj", "<ESC>")
imap("jk", "<ESC>")

-- Leader Key
nmap("<Space>", "<NOP>")
vim.g.mapleader = " "

-- Navigate between Tabs
nmap("<TAB>", ":bprev<cr>")
nmap("<S-TAB>", ":bnext<cr>")

-- Navigation between Vim Windows
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Indent Selection
vmap("<", "<gv")
vmap(">", ">gv")

-- Increment and Decrement a Number
nmap("+", "<C-a>")
nmap("-", "<C-x>")

-- Yank, Delete and Paste from ThePrimeagen
nmap("<Leader>y", '"+y')
vmap("<Leader>y", '"+y')
nmap("<Leader>Y", '"+Y')
nmap("<Leader>d", '"+d')
vmap("<Leader>d", '"+d')
xmap("<Leader>p", '"_dP')

-- Delete Character without Copy it
nmap("x", '"_x')

-- Basic
nmap("e", ":Telescope find_files<cr>")
nmap("eb", ":Telescope file_browser<cr>")
nmap("el", ":Telescope live_grep<cr>")
nmap("eg", ":Telescope git_files<cr>")

nmap("sb", ":Telescope buffers<cr>")
nmap("sv", ":vsplit<cr>")
nmap("sh", ":split<cr>")
nmap("sc", ":close<cr>")

nmap("c", ":bdelete<cr>")

-- Actions
nmap("ai", ":lua vim.lsp.buf.hover()<cr>")
nmap("<Leader>n", ":noh<cr>")

nmap("su", ":UndotreeToggle<cr>")

nmap("fo", ":foldopen<cr>")
nmap("fc", ":foldclose<cr>")

nmap("ff", ":lua vim.lsp.buf.format { async = true }<cr>")

nmap("ds", ":Telescope lsp_document_symbols<cr>")

nmap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
nmap("<leader>x", ":!chmod +x %<cr>")

nmap("<leader>p", [["_dP]])

-- Git
nmap("lg", ":LazyGit<cr>")
nmap("<Leader>g", ":Git<cr>")
nmap("<Leader>gp", ":Git push<cr>")

-- Diagnostics
nmap("da", ":lua vim.lsp.buf.code_action()<cr>")
nmap("dr", ":lua vim.lsp.buf.references()<cr>")
nmap("df", ":lua vim.lsp.buf.definition()<cr>")
nmap("dc", ":lua vim.lsp.buf.declaration()<cr>")
nmap("di", ":lua vim.lsp.buf.signature_help()<cr>")
nmap("dl", ":lua vim.diagnostic.open_float()<cr>")
nmap("db", ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>")
nmap("dw", ":Telescope diagnostics<cr>")
nmap("dn", ":lua vim.diagnostic.goto_next()<cr>zz")
nmap("dp", ":lua vim.diagnostic.goto_prev()<cr>zz")
