local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
	require("user.notify").message("Coult not load lspsaga", "Loading Error", "error")
	return
end
local status_ok_kind, kind = pcall(require, "lspsaga.lspkind")
if not status_ok_kind then
	require("user.notify").message("Coult not load lspsaga.lspkind", "Loading Error", "error")
	return
end

-- use default config
saga.init_lsp_saga()

-- use custom config
saga.init_lsp_saga({
	-- put modified options in there
})
