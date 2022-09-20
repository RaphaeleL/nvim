local status_ok, mason = pcall(require, "mason")
if not status_ok then
	require("user.notify").message("Could not load mason", "Loading Error", "error")
	return
end

mason.setup()
