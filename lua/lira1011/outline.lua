local status_ok, outline = pcall(require, "symbols-outline")
if not status_ok then
	require("user.notify").message("Could not load symbols-outline", "Loading Error", "error")
	return
end

outline.setup()
