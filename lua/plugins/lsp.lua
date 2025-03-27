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
			root_markers = { ".git" },
		})

		-- Diagnostic settings
		vim.diagnostic.config({ virtual_lines = false, virtual_text = false })

		-- Attach LSP servers
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
                vim.keymap.set("n", "gf", ":lua require('conform').format()<cr>", { desc = "LSP: Format" })
                vim.keymap.set("n", "gR", ":lua vim.lsp.buf.rename()<cr>", { silent = true })
                vim.keymap.set("n", "K", ":lua vim.lsp.buf.signature_help()<cr>", { silent = true })
			end,
		})

		-- Enable LSP for specific languages
		-- NOTE: those names are the files inside of `~/.config/nvim/lsp/*.lua`
		vim.lsp.enable({ "python", "c_cpp", "lua", "typescript", 'tailwind' })
	end,
}
