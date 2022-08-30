local status_ok, comment = pcall(require, "nvim_comment")
if not status_ok then
	require("user.notify").message("Coult not load nvim_comment", "Loading Error", "error")
	return
end
comment.setup({
	operator_mapping = "<leader>x",
})
