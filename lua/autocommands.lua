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

-- Open NvimTree in Nvim Folder View (e.g. nvim .)
vim.cmd [[
  augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'cd '.argv()[0] | exe 'NvimTreeOpen' | wincmd p | ene | exe 'cd '.getcwd() | endif
  augroup END
]]

-- Show line diagnostics automatically in hover window
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Highlight line number instead of having icons in sign column
vim.cmd [[
    highlight! DiagnosticLineNrError guifg=#b5615d
    highlight! DiagnosticLineNrWarn guifg=#c8b185
    highlight! DiagnosticLineNrInfo guifg=#88a5a2
    highlight! DiagnosticLineNrHint guifg=#85a5b2

    sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
    sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
    sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
    sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

-- Highlight symbol under cursor (aka selfmade Illuminate)
-- vim.cmd [[
--     hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
--     hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
--     hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
-- ]]
-- vim.api.nvim_create_augroup('lsp_document_highlight', {
--     clear = false
--   })
-- vim.api.nvim_clear_autocmds({
--     buffer = bufnr,
--     group = 'lsp_document_highlight',
-- })
-- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--     group = 'lsp_document_highlight',
--     buffer = bufnr,
--     callback = vim.lsp.buf.document_highlight,
-- })
-- vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--     group = 'lsp_document_highlight',
--     buffer = bufnr,
--     callback = vim.lsp.buf.clear_references,
-- })
