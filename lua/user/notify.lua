local M = {}
local notify = require("notify")

notify.setup()
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
