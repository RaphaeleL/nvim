vim.g.mapleader = " "

local map = vim.keymap.set

-- Buffer Manipulation
map("i", "kj", "<ESC>", { desc = " Buffer: Go to Normal Mode" })
map("i", "jk", "<ESC>", { desc = " Buffer: Go to Normal Mode" })
map("n", "<Space>", "<NOP>", { desc = " Buffer: Leader" })
map("n", "<TAB>", ":write<cr>:bprev<cr>", { desc = " Buffer: Next Tab and Write Buffer" })
map("n", "<S-TAB>", ":write<cr>:bnext<cr>", { desc = " Buffer: Previous Tab" })

map("n", "sh", "<C-w>h", { desc = " Buffer: Move to the left Window" })
map("n", "sj", "<C-w>j", { desc = " Buffer: Move to the bottom Window" })
map("n", "sk", "<C-w>k", { desc = " Buffer: Move to the upper Window" })
map("n", "sl", "<C-w>l", { desc = " Buffer: Move to the right Window" })
map("n", "sv", ":vsplit<cr>", { desc = " Buffer: Vertical Split" })
map("n", "ss", ":split<cr>", { desc = " Buffer: Horizontal Split" })

map("n", "<C-d>", "<C-d>zz", { desc = " Buffer: Move Page up and stay in the Middle of the Screen" })
map("n", "<C-u>", "<C-u>zz", { desc = " Buffer: Move Page up and stay in the Middle of the Screen" })

map("n", "<Leader>n", ":noh<cr>", { desc = " Buffer: No Highlighting" })

-- map("n", "<S-Up>", ":resize -2<CR>", { desc = " Buffer Resize up" })
-- map("n", "<S-Down>", ":resize +2<CR>", { desc = " Buffer Resize down" })
-- map("n", "<S-Left>", ":vertical resize -2<CR>", { desc = " Buffer Resize left" })
-- map("n", "<S-Right>", ":vertical resize +2<CR>", { desc = " Buffer Resize right" })

map("n", "c", ":bd<cr>", { desc = " Window: Quit" })

-- Window
map("n", "q", ":quit!<cr>", { desc = " Window: Quit" })

-- Char Manipulation
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = " Chars: Rename" })

map("n", "+", "<C-a>", { desc = " Chars: Increment a Number" })
map("n", "-", "<C-x>", { desc = " Chars: Decrement a Number" })

map("n", "<Leader>Y", '"+Y', { desc = " Chars: Yank line" })
map("x", "<Leader>p", '"_dP', { desc = " Chars: Paste without losing the Buffer" })
map("n", "x", '"_x', { desc = " Chars: Delete Char without losing the Buffer" })
map("i", "<C-BS>", "<Esc>cvb", { desc = " Chars: Delete a Word." })

-- Line Manipulation
map("v", "<", "<gv", { desc = " Line: Indent to Left" })
map("v", ">", ">gv", { desc = " Line: Indent to Right" })

map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = " Line: Move in a Linebreak up" })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = " Line: Move in a Linebreak down" })

map({ "n", "v" }, "<Leader>l", ":CommentToggle<cr>", { desc = " Line: Comment Selection in/out" })

map("n", "<C-a>", "GVgg", { desc = " Line: mark everything" })
map("n", "J", "mzJ`z", { desc = " Line: Concat Line without moving the Cursor" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = " Line: Move Selection up" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = " Line: Move Selection down" })

map("n", "H", "0", { desc = " Line: Move to the start of a Line" })
map("n", "L", "$", { desc = " Line: Move to the end of a Line" })

-- Diagnostic
map("n", "<Leader>e", ":lua vim.diagnostic.open_float()<cr>", { desc = "LSP: Open Diagnostic of Line" })
