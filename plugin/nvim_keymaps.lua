-- Buffer and Window
vim.keymap.set("i", "kj", "<ESC>", { desc = "LR - Buffer: Go to Normal Mode" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "LR - Buffer: Go to Normal Mode" })
vim.keymap.set("n", "<Space>", "<NOP>", { desc = "LR - Buffer: Leader" })
vim.keymap.set("n", "<TAB>", ":bprev<cr>", { desc = "LR - Buffer: Next Tab and Write Buffer" })
vim.keymap.set("n", "<S-TAB>", ":bnext<cr>", { desc = "LR - Buffer: Previous Tab" })

vim.keymap.set({"i","n"}, "<C-w>", ":q!<cr>", { desc = "LR - Buffer: Quit" })
vim.keymap.set({"i","n"}, "<C-q>", ":qa!<cr>", { desc = "LR - Buffer: Quit All" })
vim.keymap.set({"i","n"}, "<C-s>", "<esc>:wa!<cr>", { desc = "LR - Buffer: Save All" })

vim.keymap.set("n", "sh", "<C-w>h", { desc = "LR - Buffer: Move to the left Window" })
vim.keymap.set("n", "sj", "<C-w>j", { desc = "LR - Buffer: Move to the bottom Window" })
vim.keymap.set("n", "sk", "<C-w>k", { desc = "LR - Buffer: Move to the upper Window" })
vim.keymap.set("n", "sl", "<C-w>l", { desc = "LR - Buffer: Move to the right Window" })
vim.keymap.set("n", "sv", ":vsplit<cr>", { desc = "LR - Buffer: Vertical Split" })
vim.keymap.set("n", "ss", ":split<cr>", { desc = "LR - Buffer: Horizontal Split" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "LR - Buffer: Move Page up and stay in the Middle of the Screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "LR - Buffer: Move Page up and stay in the Middle of the Screen" })

vim.keymap.set("n", "<Leader>n", ":noh<cr>", { desc = "LR - Buffer: No Highlighting" })

vim.keymap.set("n", "<S-Up>", ":resize -2<CR>", { desc = "LR - Buffer Resize up" })
vim.keymap.set("n", "<S-Down>", ":resize +2<CR>", { desc = "LR - Buffer Resize down" })
vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", { desc = "LR - Buffer Resize left" })
vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", { desc = "LR - Buffer Resize right" })

vim.keymap.set("n", "<leader>c", ":bd<cr>", { desc = "LR - Window: Close" })

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Char
vim.keymap.set("n", "-", "<C-x>", { desc = "LR - Chars: Increment a Number" })
vim.keymap.set("n", "+", "<C-a>", { desc = "LR - Chars: Decrement a Number" })

vim.keymap.set({ "n", "v" }, "y", '"+y', { desc = "LR - Chars: Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "Y", '"+Y', { desc = "LR - Chars: Yank line to clipboard" })
vim.keymap.set("x", "<Leader>p", '"_dP', { desc = "LR - Chars: Paste without losing the Buffer" })
vim.keymap.set("n", "x", '"_x', { desc = "LR - Chars: Delete Char without losing the Buffer" })
vim.keymap.set("i", "<C-BS>", "<Esc>cvb", { desc = "LR - Chars: Delete a Word." })

-- Line
vim.keymap.set("v", "<", "<gv", { desc = "LR - Line: Indent to Left" })
vim.keymap.set("v", ">", ">gv", { desc = "LR - Line: Indent to Right" })

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "LR - Line: Move in a Linebreak up" })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "LR - Line: Move in a Linebreak down" })

-- NOTE: unsure if i want to keep them
vim.keymap.set("v", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "LR - Line: Move in a Linebreak up" })
vim.keymap.set("v", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "LR - Line: Move in a Linebreak down" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "LR - Line: Concat Line without moving the Cursor" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "LR - Line: Move Selection up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "LR - Line: Move Selection down" })

vim.keymap.set({ "n", "v" }, "H", "0", { desc = "LR - Line: Move to the start of a Line" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "LR - Line: Move to the end of a Line" })

-- Plugin Specific
vim.keymap.set("n", "<Leader>e", ":lua vim.diagnostic.open_float()<cr>", { desc = "LR - LSP: Open Diagnostic of Line" })
vim.keymap.set("n", "<leader>o", ":Oil<cr>", { desc = "LR - Filesystem: Open Oil Filebrowser" })
vim.keymap.set("n", "<leader>of", ":Oil --float<cr>", { desc = "LR - Filesystem: Open Oil Filebrowser Floating" })
vim.keymap.set("n", "<Leader>ts", ":InspectTree<cr>", { desc = "LR - Treesitter: Inspect Tree" })
vim.keymap.set("n", "<Leader>z", ":Lazy<cr>")

