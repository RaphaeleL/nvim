local status_ok, lsp_lines = pcall(require, "lsp_lines")
if not status_ok then
	require("user.notify").message("Could not load lsp_lines", "Loading Error", "error")
	return
end

lsp_lines.setup()
