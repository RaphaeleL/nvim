-- catppuccin/nvim
-- rebelot/kanagawa.nvim
local ok, rose_pine = pcall(require, "rose-pine")
if not ok then
  print("Couldn't require rose-pine")
  return
end

rose_pine.setup({
  disable_background = true
})

vim.cmd("colorscheme rose-pine")
