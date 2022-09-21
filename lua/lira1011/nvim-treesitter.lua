local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		colors = {
			"#68a0b0",
			"#946EaD",
			"#c7aA6D",
		},
	},
})