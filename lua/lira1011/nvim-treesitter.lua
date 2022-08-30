local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	require("user.notify").message("Could not load nvim-treesitter", "Loading Error", "error")
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
