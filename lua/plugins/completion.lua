return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
		{ "hrsh7th/cmp-buffer", event = "InsertEnter" },
		{ "hrsh7th/cmp-path", event = "InsertEnter" },
		{ "hrsh7th/cmp-cmdline", event = "InsertEnter" },
		{ "onsails/lspkind.nvim", event = "InsertEnter" },
	},
	config = function()
		require("plugins.settings.completion")
	end,
}
