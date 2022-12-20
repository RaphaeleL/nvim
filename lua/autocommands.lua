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

-- Autoformat on Save
-- for impl see after/plugin/lsp.lua

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "plugins.lua" },
  callback = function()
    vim.cmd([[source <afile> | PackerSync]])
  end,
})
