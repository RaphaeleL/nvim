return {
	{
		"<leader>S",
		function()
			require("spectre").open()
		end,
		desc = "Search and Replace in files",
	},
}
