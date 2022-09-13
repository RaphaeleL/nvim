local M = {}
local status_ok, notify = pcall(require, "notify")
if not status_ok then
	require("user.notify").message("Could not load notify", "Loading Error", "error")
	return
end

notify.setup({
	background_colour = "#000000",
})
vim.notify = notify

function M.message(msg, title, type)
	vim.notify(msg, type, {
		title = title,
		on_open = function(win)
			local buf = vim.api.nvim_win_get_buf(win)
			vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
		end,
	})
end
return M
