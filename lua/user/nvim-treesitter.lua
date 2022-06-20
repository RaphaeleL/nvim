local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	require("user.notify").message("Coult not load nvim-treesitter", "Loading Error", "error")
	return
end

treesitter.setup({
	highlight = {

		enable = true,
	},
})
