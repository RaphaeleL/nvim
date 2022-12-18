local function nmap(old, new, desc) vim.api.nvim_set_keymap("n", old, new, { silent = true, noremap = true, desc = desc }) end

local function vmap(old, new, desc) vim.api.nvim_set_keymap("v", old, new, { silent = true, noremap = true, desc = desc }) end

local function imap(old, new, desc) vim.api.nvim_set_keymap("i", old, new, { silent = true, noremap = true, desc = desc }) end

local function xmap(old, new, desc) vim.api.nvim_set_keymap("x", old, new, { silent = true, noremap = true, desc = desc }) end

-- New Escape Key
imap("kj", "<ESC>")
imap("jk", "<ESC>")

-- Leader Key
nmap("<Space>", "<NOP>")
vim.g.mapleader = " "

nmap("<TAB>", ":bprev<cr>")
nmap("<S-TAB>", ":bnext<cr>")

nmap("<C-h>", "<C-w>h", "Navigate in Windows down")
nmap("<C-j>", "<C-w>j", "Navigate in Windows left")
nmap("<C-k>", "<C-w>k", "Navigate in Windows up")
nmap("<C-l>", "<C-w>l", "Navigate in Windows right")

vmap("<", "<gv", "Indent Selection in")
vmap(">", ">gv", "Indent Selection out")

nmap("+", "<C-a>", "Increment Number")
nmap("-", "<C-x>", "Decrement Number")

nmap("<Leader>Y", '"+Y', "Yank Complete Line")
nmap("<Leader>d", '"+d', "Delete without overwrite Clipboard")
vmap("<Leader>d", '"+d', "Delete without overwrite Clipboard")
xmap("<Leader>p", '"_dP', "Paste without overwrite Clipboard")

nmap("x", '"_x', "Delete Char without overwrite Clipboard")

nmap("e", ":Telescope find_files<cr>", "File Explorer")
nmap("el", ":Telescope live_grep<cr>", "Live Grep in Project")
nmap("eg", ":Telescope git_files<cr>", "File Explorer with Git Files")

nmap("sb", ":Telescope buffers<cr>", "[S]how  Buffers")
nmap("sv", ":vsplit<cr>", "Split Vertical")
nmap("sh", ":split<cr>", "Split Horizontal")
nmap("sc", ":close<cr>", "Close Split")
nmap("c", ":bdelete<cr>", "Close Buffer")

nmap("J", "mzJ`z", "Concat line without loosing, the Cursor")

nmap("ai", ":lua vim.lsp.buf.hover()<cr>", "More Informations about Keyword")
nmap("<Leader>n", ":noh<cr>", "No Highlighting")

nmap("su", ":UndotreeToggle<cr>", "[S]how Undotree")

nmap("fo", ":foldopen<cr>", "Open a folded Expression")
nmap("fc", ":foldclose<cr>", "Fold an Expression")

nmap("ff", ":lua vim.lsp.buf.format { async = true }<cr>", "[F]ormat [F]ile")

nmap("ds", ":Telescope lsp_document_symbols<cr>", "Show [D]ocument [S]ymbols (Outliner)")

nmap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Rename")
nmap("<leader>x", ":!chmod +x %<cr>", "Adding Execution Permission")

nmap("<C-d>", "<C-d>zz", "Scroll Down and stay in the Middle")
nmap("<C-u>", "<C-u>zz", "Scroll Up and stay in the Middle")

nmap("km", ":Telescope keymaps<cr>", "Help about [K]ey[m]aps")

nmap("<Leader>g", ":Git<cr>", "Open [G]it Client")
nmap("<Leader>gd", ":Git diff<cr>", "Open [G]it [D]iffs")
nmap("<Leader>gb", ":Git blame<cr>", "Open [G]it [B]lame History")
nmap("<Leader>ga", ":Git add .<cr>", "[G]it [A]dd all Changed Files")
nmap("<Leader>gc", ":Git commit<cr>", "[G]it [C]ommit Files")

nmap("sa", ":lua vim.lsp.buf.code_action()<cr>", "[S]how Code [A]ctions")
nmap("si", ":lua vim.lsp.buf.signature_help()<cr>", "[S]how Keyword [I]nformations")
nmap("sl", ":lua vim.diagnostic.open_float()<cr>", "[S]how [L]ine Diagnostics")
nmap("sb", ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "[S]how [Buffer] Diagnostics")
nmap("sd", ":Telescope diagnostics<cr>", "[S]how Workspace [D]iagnostics")

nmap("sw", ":Telescope grep_string<cr>", "[S]how current [W]ord")

nmap("sr", ":lua vim.lsp.buf.references()<cr>", "[S]how [R]eference")
nmap("sf", ":lua vim.lsp.buf.definition()<cr>", "[S]how De[f]inition")
nmap("sc", ":lua vim.lsp.buf.declaration()<cr>", "[S]how De[c]laration")
nmap("sn", ":lua vim.diagnostic.goto_next()<cr>zz", "[S]how [n]ext Diagnostic")
nmap("sp", ":lua vim.diagnostic.goto_prev()<cr>zz", "[S]how [p]rev Diagnostic")
