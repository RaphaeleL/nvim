local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
	require("user.notify").message("Could not load neogit", "Loading Error", "error")
	return
end

neogit.setup({
	disable_signs = false,
	disable_hint = false,
	disable_context_highlighting = false,
	disable_commit_confirmation = false,
	auto_refresh = true,
	disable_builtin_notifications = false,
	use_magit_keybindings = false,
	kind = "tab",
	commit_popup = {
		kind = "split",
	},
	popup = {
		kind = "split",
	},
	signs = {
		section = { ">", "v" },
		item = { ">", "v" },
		hunk = { "", "" },
	},
	integrations = {
		diffview = false,
	},
	sections = {
		untracked = {
			folded = false,
		},
		unstaged = {
			folded = false,
		},
		staged = {
			folded = false,
		},
		stashes = {
			folded = true,
		},
		unpulled = {
			folded = true,
		},
		unmerged = {
			folded = false,
		},
		recent = {
			folded = true,
		},
	},
	mappings = {
		status = {
			["B"] = "BranchPopup",
			["s"] = "",
		},
	},
})
