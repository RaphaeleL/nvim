local status_ok, jaq = pcall(require, "jaq-nvim")
if not status_ok then
	require("user.notify").message("Coult not load jaq-nvim", "Loading Error", "error")
	return
end

jaq.setup({
	cmds = {
		default = "term",
		internal = {
			lua = "luafile %",
			vim = "source %",
		},
		external = {
			javascript = "node %",
			python = "python3 %",
			go = "go run %",
			rust = "cargo run",
			cpp = "g++ % -o $fileBase -O3 && ./$fileBase",
			c = "gcc % -o $fileBase -O3 && ./$fileBase",
		},
	},

	behavior = {
		default = "float",
		startinsert = false,
		wincmd = false,
		autosave = false,
	},

	ui = {
		float = {
			border = "none",
			winhl = "Normal",
			borderhl = "FloatBorder",
			winblend = 0,
			height = 0.8,
			width = 0.8,
			x = 0.5,
			y = 0.5,
		},

		terminal = {
			position = "bot",
			size = 10,
			line_no = false,
		},

		quickfix = {
			position = "bot",
			size = 10,
		},
	},
})
