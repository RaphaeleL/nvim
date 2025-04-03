-- LspStart on InsertEnter
-- vim.api.nvim_create_autocmd("InsertEnter", {
--     pattern = "*",
--     command = "LspStart"
-- })

-- Attach LSP (right now it's just for the keymaps - https://gpanders.com/blog/whats-new-in-neovim-0-11/#builtin-auto-completion)
-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(args)
--         vim.keymap.set("n", "gf", ":lua require('conform').format()<cr>", { desc = "LSP: Format" })
--         vim.keymap.set("n", "gR", ":lua vim.lsp.buf.rename()<cr>", { silent = true })
--         vim.keymap.set("n", "K", ":lua vim.lsp.buf.signature_help()<cr>", { silent = true })
--     end,
-- })

-- Highlight Yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

-- Open Oil in the default Folder View
vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("ProjectDrawer", { clear = true }),
    callback = function()
        if #vim.v.argv == 1 and vim.fn.isdirectory(vim.v.argv[1]) and not vim.v.s.std_in then
            vim.cmd("cd " .. vim.v.argv[1])
            vim.cmd("Oil")
            vim.cmd("wincmd p")
            vim.cmd("ene")
            vim.cmd("cd " .. vim.fn.getcwd())
        end
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
    callback = function(event)
        local exclude = { "gitcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
            return
        end
        vim.b[buf].lazyvim_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = vim.api.nvim_create_augroup("json_conceal", { clear = true }),
    pattern = { "json", "jsonc", "json5" },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

-- no spell in markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },
    command = "setlocal nospell",
})

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", {}),
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.scrolloff = 0
        vim.opt.numberwidth = 2

        vim.bo.filetype = "terminal"
    end,
})

-- Hide Copilot on suggestion
vim.api.nvim_create_autocmd('User', {
  pattern = 'BlinkCmpMenuOpen',
  callback = function()
    require("copilot.suggestion").dismiss()
    vim.b.copilot_suggestion_hidden = true
  end,
})

-- Show Copilot on suggestion
vim.api.nvim_create_autocmd('User', {
  pattern = 'BlinkCmpMenuClose',
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})
