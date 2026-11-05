
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Increment / Decrement
keymap("n", "-", "<C-x>", opts)                  -- Decrement the number under the cursor
keymap("n", "+", "<C-a>", opts)                  -- Increment the number under the cursor

-- Selection
keymap("n", "<C-a>", "gg<S-v>G", opts)           -- Select the entire buffer

-- Insert Mode
keymap("i", "kj", "<ESC>", opts)                 -- Exit Insert mode
keymap("i", "jk", "<ESC>", opts)                 -- Exit Insert mode

-- Buffer Navigation
keymap("n", "<Space>", "<NOP>", opts)            -- Disable the default Space behavior (reserve as Leader)
keymap("n", "<TAB>", ":bprev<CR>", opts)         -- Switch to the previous buffer
keymap("n", "<S-TAB>", ":bnext<CR>", opts)       -- Switch to the next buffer
keymap("n", "<Leader>bd", ":bd<CR>", opts)       -- Delete the current buffer

-- Window Splits
keymap("n", "sv", ":vsplit<CR>", opts)           -- Create a vertical split
keymap("n", "ss", ":split<CR>", opts)            -- Create a horizontal split

-- Window Navigation
keymap("n", "sh", "<C-w>h", opts)                -- Move to the window on the left
keymap("n", "sj", "<C-w>j", opts)                -- Move to the window below
keymap("n", "sk", "<C-w>k", opts)                -- Move to the window above
keymap("n", "sl", "<C-w>l", opts)                -- Move to the window on the right

-- Window Resizing
keymap("n", "<S-Up>", ":resize -2<CR>", opts)    -- Decrease window height
keymap("n", "<S-Down>", ":resize +2<CR>", opts)  -- Increase window height
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)  -- Decrease window width
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts) -- Increase window width

-- Scrolling
keymap("n", "<C-d>", "<C-d>zz", opts)            -- Scroll down and center the cursor
keymap("n", "<C-u>", "<C-u>zz", opts)            -- Scroll up and center the cursor

-- Search
keymap("n", "<Leader>n", ":noh<CR>", opts)       -- Clear search highlighting

-- Indentation
keymap("v", "<", "<gv", opts)                    -- Decrease indentation and reselect the selection
keymap("v", ">", ">gv", opts)                    -- Increase indentation and reselect the selection

-- Wrapped Line Navigation
keymap({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }) -- Move up by display line unless a count is given
keymap({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }) -- Move down by display line unless a count is given

-- Line Manipulation
keymap("n", "J", "mzJ`z", opts)                  -- Join the next line without moving the cursor
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)        -- Move the selected lines down
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)        -- Move the selected lines up

-- Line Navigation
keymap({ "n", "v" }, "H", "0", opts)             -- Move to the first column of the line
keymap({ "n", "v" }, "L", "$", opts)             -- Move to the last character of the line

-- Plugin Specific
keymap("n", "<Leader>e", ":lua vim.diagnostic.open_float()<CR>", opts) -- Show diagnostic information in a floating window
keymap("n", "<Leader>o", ":Oil --float<CR>", opts)        -- Open Oil file explorer
keymap("n", "<Leader>ts", ":InspectTree<CR>", opts) -- Open the Treesitter syntax tree inspector
keymap("n", "<Leader>z", ":Lazy<CR>", opts)       -- Open Lazy plugin manager

-- Register Management
keymap("n", "x", '"_x', opts)                    -- Delete character without overwriting the yank register
keymap("n", "<Leader>p", '"0p', opts)            -- Paste the last yanked text after the cursor
keymap("n", "<Leader>P", '"0P', opts)            -- Paste the last yanked text before the cursor
keymap("n", "<Leader>c", '"_c', opts)            -- Change text without overwriting the yank register
keymap("n", "<Leader>C", '"_C', opts)            -- Change from cursor to end of line without overwriting the yank register
keymap("v", "<Leader>c", '"_c', opts)            -- Change selection without overwriting the yank register
keymap("n", "<Leader>d", '"_d', opts)            -- Delete text without overwriting the yank register
keymap("n", "<Leader>D", '"_D', opts)            -- Delete from cursor to end of line without overwriting the yank register
keymap("v", "<Leader>d", '"_d', opts)            -- Delete selection without overwriting the yank register

-- Clipboard
keymap({ "n", "v" }, "y", '"+y', opts)           -- Yank text to the system clipboard
keymap({ "n", "v" }, "Y", '"+Y', opts)           -- Yank line or selection to the system clipboard
keymap("x", "<Leader>p", '"_d"0P', opts)         -- Replace selection with last yanked text without overwriting the yank register

-- Miscellaneous
keymap("i", "<C-BS>", "<C-w>", opts)             -- Delete the word before the cursor in Insert mode
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", opts)   -- Exit Terminal mode and enter Terminal-Normal mode

