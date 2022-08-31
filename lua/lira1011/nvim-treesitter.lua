local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	require("lira1011.notify").message("Could not load nvim-treesitter", "Loading Error", "error")
	return
end

local status_ok_context, treesitter_context = pcall(require, "treesitter-context")
if not status_ok_context then
	require("lira1011.notify").message("Could not load treesitter-context", "Loading Error", "error")
	return
end

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

treesitter_context.setup({
	enable = true,
	max_lines = 0,
	trim_scope = "outer",
	patterns = {
		default = {
			"class",
			"function",
			"method",
			"for",
			"while",
			"if",
			"switch",
			"case",
		},
	},
	zindex = 20,
	mode = "cursor",
	separator = nil,
})
