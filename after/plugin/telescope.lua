local telescope = require("telescope")

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = "  ",
		path_display = { "smart" },
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})
