local status_ok, numb = pcall(require, "numb")
if not status_ok then
	require("user.notify").message("Coult not load numb", "Loading Error", "error")
	return
end

numb.setup({
	show_numbers = true,
	show_cursorline = true,
	number_only = false,
	centered_peeking = true,
})
