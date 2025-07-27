require("multicursor-nvim").setup()

vim.api.nvim_set_hl(0, "MultiCursorCursor", { reverse = true })
vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
vim.api.nvim_set_hl(0, "MultiCursorSign", { link = "SignColumn" })
vim.api.nvim_set_hl(0, "MultiCursorMatchPreview", { link = "Search" })
vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { reverse = true })
vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
vim.api.nvim_set_hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })

vim.api.nvim_set_keymap("n", "mj", "<cmd>lua require('multicursor-nvim').lineAddCursor(1)<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "mj", "<cmd>lua require('multicursor-nvim').lineAddCursor(1)<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mk", "<cmd>lua require('multicursor-nvim').lineAddCursor(-1)<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "mk", "<cmd>lua require('multicursor-nvim').lineAddCursor(-1)<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mc", "<cmd>lua require('multicursor-nvim').clearCursors()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "mc", "<cmd>lua require('multicursor-nvim').clearCursors()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mm", "<cmd>lua require('multicursor-nvim').matchCursors()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "mm", "<cmd>lua require('multicursor-nvim').matchCursors()<cr>", { noremap = true, silent = true })


require("nvim_comment").setup()
vim.api.nvim_set_keymap("n", "<Leader>l", ":CommentToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>l", ":CommentToggle<cr>", { noremap = true, silent = true })

-- require("grug-far").setup({})
-- vim.api.nvim_set_keymap("n", "<leader>gr", ":GrugFar<cr>", { noremap = true, silent = true })

require("snacks").setup({
    picker = {
        icons = {
            files = { enabled = false, },
            keymaps = { nowait = "" },
            tree = {
                vertical = "│ ",
                middle   = "├╴",
                last     = "└╴",
            },
            undo = { saved = "", },
            ui = {
                live       = "󰐰 ",
                hidden     = "h",
                ignored    = "i",
                follow     = "f",
                selected   = "● ",
                unselected = "○ ",
                -- selected = " ",
            },
            git = { enabled = false },
            diagnostics = {
                Error = "",
                Warn  = "",
                Hint  = "",
                Info  = "",
            },
            lsp = {
                unavailable = "",
                enabled = "",
                disabled = "",
                attached = ""
            },
            kinds = {}
        },
        files = {
            hidden = true,
            ignored = false,
        },
        enabled = true,
        layout = {
            preset = 'ivy',
            border = "none",
        },
        sources = {
            explorer = { layout = { layout = { position = "right" } } },
        },
        win = { list = { keys = { ["<TAB>"] = "confirm" } } },
    },
    bigfile = { enabled = true },
    input = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    dashboard = { enabled = false },
    scroll = { enabled = false },
    indent = { enabled = false },
    notifier = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    explorer = {
        enabled = true,
        replace_netrw = false, -- Oil is doing this
    },
})

vim.api.nvim_set_keymap("n", "<leader><space>", function() Snacks.picker.smart() end, { noremap = true, silent = true, desc = "Smart Find Files" })
vim.api.nvim_set_keymap("n", "<leader>d", function() Snacks.picker.diagnostics() end, { noremap = true, silent = true, desc = "Diagnostics" })
vim.api.nvim_set_keymap("n", "<leader>b", function() Snacks.picker.buffers() end, { noremap = true, silent = true, desc = "Buffers" })
vim.api.nvim_set_keymap("n", "<leader>/", function() Snacks.picker.grep() end, { noremap = true, silent = true, desc = "Grep" })
vim.api.nvim_set_keymap("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { noremap = true, silent = true, desc = "Diagnostics" })
vim.api.nvim_set_keymap("n", "<leader>sk", function() Snacks.picker.keymaps() end, { noremap = true, silent = true, desc = "Keymaps" })
vim.api.nvim_set_keymap("n", "<leader>su", function() Snacks.picker.undo() end, { noremap = true, silent = true, desc = "Undo History" })
vim.api.nvim_set_keymap("n", "<leader>se", function() Snacks.picker.explorer() end, { noremap = true, silent = true, desc = "Explorer" })

vim.api.nvim_set_keymap("n", "gd", function() Snacks.picker.lsp_definitions() end, { noremap = true, silent = true, desc = "Goto Definition" })
vim.api.nvim_set_keymap("n", "gD", function() Snacks.picker.lsp_declarations() end, { noremap = true, silent = true, desc = "Goto Declaration" })
vim.api.nvim_set_keymap("n", "gr", function() Snacks.picker.lsp_references() end, { noremap = true, silent = true, desc = "References", nowait = true })
vim.api.nvim_set_keymap("n", "gi", function() Snacks.picker.lsp_implementations() end, { noremap = true, silent = true, desc = "Goto Implementation" })
vim.api.nvim_set_keymap("n", "gt", function() Snacks.picker.lsp_type_definitions() end, { noremap = true, silent = true, desc = "Goto T[y]pe Definition" })
vim.api.nvim_set_keymap("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { noremap = true, silent = true, desc = "LSP Symbols" })

vim.api.nvim_set_keymap("n", "<leader>sf", function() Snacks.picker.smart() end, { noremap = true, silent = true, desc = "Smart Find Files" })
vim.api.nvim_set_keymap("n", "<leader>sb", function() Snacks.picker.buffers() end, { noremap = true, silent = true, desc = "Buffers" })
vim.api.nvim_set_keymap("n", "<leader>sg", function() Snacks.picker.git_files() end, { noremap = true, silent = true, desc = "Find Git Files" })
vim.api.nvim_set_keymap("n", "<leader>sr", function() Snacks.picker.recent() end, { noremap = true, silent = true, desc = "Recent" })
vim.api.nvim_set_keymap("n", "<leader>sl", function() Snacks.picker.grep() end, { noremap = true, silent = true, desc = "Grep" })

vim.api.nvim_set_keymap("n", "<leader>gs", function() Snacks.picker.git_files() end, { noremap = true, silent = true, desc = "Find Git Files" })
vim.api.nvim_set_keymap("n", "<leader>gb", function() Snacks.picker.git_branches() end, { noremap = true, silent = true, desc = "Git Branches" })
vim.api.nvim_set_keymap("n", "<leader>gl", function() Snacks.picker.git_log() end, { noremap = true, silent = true, desc = "Git Log" })
vim.api.nvim_set_keymap("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { noremap = true, silent = true, desc = "Git Log File" })
vim.api.nvim_set_keymap("n", "<leader>gg", function() Snacks.lazygit() end, { noremap = true, silent = true, desc = "Lazygit" })

vim.api.nvim_set_keymap("n", "<leader>s/", function() Snacks.picker.search_history() end, { noremap = true, silent = true, desc = "Search History" })
vim.api.nvim_set_keymap("n", "<leader>sc", function() Snacks.picker.command_history() end, { noremap = true, silent = true, desc = "Command   History" })
vim.api.nvim_set_keymap("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { noremap = true, silent = true, desc = "Colorschemes" })
