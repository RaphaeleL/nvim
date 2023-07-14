vim.g.mapleader = " "

-- Buffer Manipulation
vim.keymap.set("i", "kj", "<ESC>", { desc = "(NaaVim) Buffer: Go to Normal Mode" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "(NaaVim) Buffer: Go to Normal Mode" })
vim.keymap.set("n", "<Space>", "<NOP>", { desc = "(NaaVim) Buffer: Leader" })
vim.keymap.set("n", "<C-s>", ":wa!<cr>", { desc = "(NaaVim) Buffer: Force Write everything" })
vim.keymap.set("n", "<C-w>", ":wqa!<cr>", { desc = "(NaaVim) Buffer: Force Write and Quit everything" })
vim.keymap.set("n", "<TAB>", ":write<cr>:bprev<cr>", { desc = "(NaaVim) Buffer: Next Tab and Write Buffer" })
vim.keymap.set("n", "<S-TAB>", ":write<cr>:bnext<cr>", { desc = "(NaaVim) Buffer: Previous Tab and Write Buffer" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "(NaaVim) Buffer: Move to the left Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "(NaaVim) Buffer: Move to the bottom Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "(NaaVim) Buffer: Move to the upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "(NaaVim) Buffer: Move to the right Window" })
vim.keymap.set("n", "sv", ":vsplit<cr>", { desc = "(NaaVim) Buffer: Vertical Split" })
vim.keymap.set("n", "sh", ":split<cr>", { desc = "(NaaVim) Buffer: Horizontal Split" })
vim.keymap.set("n", "q", ":bdelete!<cr>", { desc = "(NaaVim) Buffer: Delete Buffer" })
vim.keymap.set("n", "c", ":close!<cr>", { desc = "(NaaVim) Buffer: Close Buffer" })
vim.keymap.set("n", "<leader>q", ":bdelete!<cr>", { desc = "(NaaVim) Buffer: Quit Buffer" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "(NaaVim) Buffer: Move Page up and stay in the Middle of the Screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "(NaaVim) Buffer: Move Page up and stay in the Middle of the Screen" })
vim.keymap.set("n", "<Leader>n", ":noh<cr>", { desc = "(NaaVim) Buffer: No Highlighting" })
vim.keymap.set("n", "<S-Up>", ":resize -2<CR>", { desc = "(NaaVim) Buffer Resize up" })
vim.keymap.set("n", "<S-Down>", ":resize +2<CR>", { desc = "(NaaVim) Buffer Resize down" })
vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", { desc = "(NaaVim) Buffer Resize left" })
vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", { desc = "(NaaVim) Buffer Resize right" })

-- Char Manipulation
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "(NaaVim) Chars: Rename" })
vim.keymap.set("n", "<leader>x", ":!chmod +x %<cr>", { desc = "(NaaVim) Chars: Add Execution Permission to the File" })
vim.keymap.set("n", "<leader>c", ":! make -j4", { desc = "(NaaVim) Run: Run the Compilation Command" })
vim.keymap.set("n", "+", "<C-a>", { desc = "(NaaVim) Chars: Increment a Number" })
vim.keymap.set("n", "-", "<C-x>", { desc = "(NaaVim) Chars: Decrement a Number" })
vim.keymap.set("n", "<Leader>Y", '"+Y', { desc = "(NaaVim) Chars: Yank line" })
vim.keymap.set("x", "<Leader>p", '"_dP', { desc = "(NaaVim) Chars: Paste without losing the Buffer" })
vim.keymap.set("n", "x", '"_x', { desc = "(NaaVim) Chars: Delete Char without losing the Buffer" })
vim.keymap.set("i", "<C-BS>", "<Esc>cvb", { desc = "(Naavim) Chars: Delete a Word." })

-- Line Manipulation
vim.keymap.set("v", "<", "<gv", { desc = "(NaaVim) Line: Indent to Left" })
vim.keymap.set("v", ">", ">gv", { desc = "(NaaVim) Line: Indent to Right" })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "(NaaVim) Line: Move in a Linebreak up" })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "(NaaVim) Line: Move in a Linebreak down" })
vim.keymap.set({ "n", "v" }, "<Leader>l", ":CommentToggle<cr>", { desc = "(NaaVim) Line: Comment Selection in/out" })
vim.keymap.set("n", "<leader>a", "GVgg", { desc = "(NaaVim) line: mark everything" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "(NaaVim) Line: Move Selection up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "(NaaVim) Line: Move Selection down" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "(NaaVim) Line: Concat Line without moving the Cursor" })
vim.keymap.set("n", "H", "0", { desc = "(NaaVim) Line: Move to the start of a Line" })
vim.keymap.set("n", "L", "$", { desc = "(NaaVim) Line: Move to the end of a Line" })

-- File System 
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", { desc = "(NaaVim) UI: File Explorer" })
