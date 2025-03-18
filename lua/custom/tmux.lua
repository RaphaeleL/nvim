M = {}

function M.navRight()
  vim.cmd("!tmux next-window")
end

function M.navLeft()
  vim.cmd("!tmux previous-window")
end

function M.split()
  vim.cmd("!tmux split-window")
end

return M
