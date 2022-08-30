local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lira1011.lsp.lsp-signature")
require("lira1011.lsp.lsp-installer")
require("lira1011.lsp.handlers").setup()
require("lira1011.lsp.null-ls")
