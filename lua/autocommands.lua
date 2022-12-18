-- Set wrap and spell in markdown
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "tex", "text" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

-- use 'q' to quit from some plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "Git",
    "Jaq",
    "qf",
    "help",
    "man",
    "lspinfo",
    "DressingSelect",
    "Markdown",
  },
  callback = function()
    vim.cmd([[
            nnoremap <silent> <buffer> q :close <cr>
            set nobuflisted
        ]])
  end,
})

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "plugins.lua" },
  callback = function()
    vim.cmd([[source <afile> | PackerSync]])
  end,
})

-- Faster yank
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
