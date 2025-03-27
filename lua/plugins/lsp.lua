return {
	"williamboman/mason.nvim",
	-- event = "InsertEnter",
	dependencies = {
        {'saghen/blink.cmp', event = { "InsertEnter" }},
		"stevearc/conform.nvim",
		"j-hui/fidget.nvim",
	},
	config = function()
		require("fidget").setup({
			notification = {
				window = {
					winblend = 0,
				},
			},
		})

		require("mason").setup({ PATH = "prepend" })

		-- Autoformatting Setup
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
			},
		})

		for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
			vim.fn.sign_define("DiagnosticSign" .. diag, {
				text = "",
				texthl = "DiagnosticSign" .. diag,
				linehl = "",
				numhl = "DiagnosticSign" .. diag,
			})
		end

		-- Default LSP Settings for all LSP servers
		vim.lsp.config("*", {
			capabilities = require('blink.cmp').get_lsp_capabilities(),
			-- capabilities = {
			-- 	textDocument = {
			-- 		semanticTokens = {
			-- 			multilineTokenSupport = true,
			-- 		},
			-- 	},
			-- },
			root_markers = { ".git" },
		})

		-- Diagnostic settings
		vim.diagnostic.config({ virtual_lines = false, virtual_text = false })

		-- Attach LSP servers
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("my.lsp", {}), -- NOTE: is my.lsp a dummy name ?
			callback = function(args)
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

				if client:supports_method("textDocument/implementation") then
					-- Create a keymap for vim.lsp.buf.implementation ...
				end

				-- if client:supports_method("textDocument/completion") then
				-- 	-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
				-- 	-- Optional: trigger autocompletion on EVERY keypress. May be slow!
				-- 	-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
				-- 	-- client.server_capabilities.completionProvider.triggerCharacters = chars
				--
					vim.keymap.set("n", "gf", ":lua require('conform').format()<cr>", { desc = "LSP: Format" })
					vim.keymap.set("n", "gR", ":lua vim.lsp.buf.rename()<cr>", { silent = true })
					vim.keymap.set("n", "K", ":lua vim.lsp.buf.signature_help()<cr>", { silent = true })
				--
				-- 	vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
				-- end
			end,
		})

		-- Enable LSP for specific languages
		-- NOTE: those names are the files inside of `~/.config/nvim/lsp/*.lua`
		vim.lsp.enable({ "python", "c_cpp", "lua", "typescript", 'tailwind' })
	end,
}
