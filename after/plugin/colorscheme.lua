-- catppuccin/nvim
-- rebelot/kanagawa.nvim
local ok, rose_pine = pcall(require, "rose-pine")
if not ok then
  return
end

rose_pine.setup({
  disable_background = true
})

vim.cmd("colorscheme rose-pine")
