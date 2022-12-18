local function nmap(old, new, desc) vim.api.nvim_set_keymap("n", old, new, { silent = true, noremap = true, desc = desc }) end

local function vmap(old, new, desc) vim.api.nvim_set_keymap("v", old, new, { silent = true, noremap = true, desc = desc }) end

local function imap(old, new, desc) vim.api.nvim_set_keymap("i", old, new, { silent = true, noremap = true, desc = desc }) end

local function xmap(old, new, desc) vim.api.nvim_set_keymap("x", old, new, { silent = true, noremap = true, desc = desc }) end

-- CATEGORIES:
-- Window: Hacking with the Window, Buffer, ...
-- Action: Shorten some Keybinds 
-- Git: Git Client Shortcuts
-- Help: What keybind should i use again? :D 
-- LSP

imap("kj", "<ESC>")
imap("jk", "<ESC>")

nmap("<Space>", "<NOP>")
vim.g.mapleader = " "

nmap("<C-h>", "<C-w>h", "Window: Navigate in Windows down")
nmap("<C-j>", "<C-w>j", "Window: Navigate in Windows left")
nmap("<C-k>", "<C-w>k", "Window: Navigate in Windows up")
nmap("<C-l>", "<C-w>l", "Window: Navigate in Windows right")
nmap("sb", ":Telescope buffers<cr>", "Window: [S]how  Buffers")
nmap("sv", ":vsplit<cr>", "Window: Split Vertical")
nmap("sh", ":split<cr>", "Window: Split Horizontal")
nmap("sc", ":close<cr>", "Window: Close Split")
nmap("c", ":bdelete<cr>", "Window: Close Buffer")
nmap("<C-d>", "<C-d>zz", "Window: Scroll Down and stay in the Middle")
nmap("<C-u>", "<C-u>zz", "Window: Scroll Up and stay in the Middle")

nmap("<TAB>", ":bprev<cr>", "Action: Next Tab")
nmap("<S-TAB>", ":bnext<cr>", "Action: Prev Tab")
nmap("J", "mzJ`z", "Action: Concat line without loosing, the Cursor")
nmap("<Leader>n", ":noh<cr>", "Action: No Highlighting")
nmap("su", ":UndotreeToggle<cr>", "Action: [S]how Undotree")
nmap("fo", ":foldopen<cr>", "Action: Open a folded Expression")
nmap("fc", ":foldclose<cr>", "Action: Fold an Expression")
nmap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Action: Rename")
nmap("<leader>x", ":!chmod +x %<cr>", "Action: Adding Execution Permission")
vmap("<", "<gv", "Action: Indent Selection in")
vmap(">", ">gv", "Action: Indent Selection out")
nmap("+", "<C-a>", "Action: Increment Number")
nmap("-", "<C-x>", "Action: Decrement Number")
nmap("<Leader>Y", '"+Y', "Action: Yank Complete Line")
nmap("<Leader>d", '"+d', "Action: Delete without overwrite Clipboard")
vmap("<Leader>d", '"+d', "Action: Delete without overwrite Clipboard")
xmap("<Leader>p", '"_dP', "Action: Paste without overwrite Clipboard")
nmap("x", '"_x', "Action: Delete Char without overwrite Clipboard")
nmap("e", ":Telescope find_files<cr>", "Action: File Explorer")
nmap("el", ":Telescope live_grep<cr>", "Action: Live Grep in Project")
nmap("eg", ":Telescope git_files<cr>", "Action: File Explorer with Git Files")

nmap("km", ":Telescope keymaps<cr>", "Help: [K]ey[m]aps")

nmap("<Leader>g", ":Git<cr>", "Git: Open [G]it Client")
nmap("<Leader>gd", ":Git diff<cr>", "Git: Open [G]it [D]iffs")
nmap("<Leader>gb", ":Git blame<cr>", "Git: Open [G]it [B]lame History")
nmap("<Leader>ga", ":Git add .<cr>", "Git: [G]it [A]dd all Changed Files")
nmap("<Leader>gc", ":Git commit<cr>", "Git: [G]it [C]ommit Files")

nmap("sa", ":lua vim.lsp.buf.code_action()<cr>", "LSP: [S]how Code [A]ctions")
nmap("sl", ":lua vim.diagnostic.open_float()<cr>", "LSP: [S]how [L]ine Diagnostics")
nmap("sb", ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "LSP: [S]how [Buffer] Diagnostics")
nmap("sd", ":Telescope diagnostics<cr>", "LSP: [S]how Workspace [D]iagnostics")
nmap("sw", ":Telescope grep_string<cr>", "LSP: [S]how current [W]ord")
nmap("gr", ":lua vim.lsp.buf.references()<cr>", "LSP: [G]o to [R]eference")
nmap("gd", ":lua vim.lsp.buf.definition()<cr>", "LSP: [G]o to [D]efinition")
nmap("gn", ":lua vim.diagnostic.goto_next()<cr>zz", "LSP: [G]o to [n]ext Diagnostic")
nmap("gp", ":lua vim.diagnostic.goto_prev()<cr>zz", "LSP: [G]o to [p]rev Diagnostic")
nmap("K", ":lua vim.lsp.buf.hover()<cr>", "LSP: Hover Documentation")
nmap("<leader>k", ":lua vim.lsp.buf.signature_help()<cr>", "LSP: Signature Hover Documentation")
nmap("ff", ":lua vim.lsp.buf.format { async = true }<cr>", "LSP: [F]ormat [F]ile")
nmap("ds", ":Telescope lsp_document_symbols<cr>", "Show [D]ocument [S]ymbols (Outliner)")
