vim.keymap.set("n", "e", ":Telescope find_files<cr>")
vim.keymap.set("n", "el", ":Telescope live_grep<cr>")
vim.keymap.set("n", "eg", ":Telescope git_files<cr>")
vim.keymap.set("n", "sb", ":Telescope buffers<cr>")
vim.keymap.set("n", "sd", ":Telescope diagnostics<cr>")
vim.keymap.set("n", "sw", ":Telescope grep_string<cr>")
vim.keymap.set("n", "ds", ":Telescope lsp_document_symbols<cr>")
-- vim.keymap.set("n", "sb", ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>")
-- vim.keymap.set("n", "km", ":Telescope keymaps<cr>") -- Slows down the Movement somehow
