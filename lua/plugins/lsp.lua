return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"j-hui/fidget.nvim",
			"stevearc/conform.nvim",
			"b0o/SchemaStore.nvim",
		},
		config = function()
			require("plugins.settings.lsp")
		end,
	},
}
