local cmp_status_ok, bufferline = pcall(require, "bufferline")
if not cmp_status_ok then
	return
end

bufferline.setup({
	animation = false,
	auto_hide = true,
	tabpages = true,
	closable = true,
	clickable = true,
	exclude_ft = { "javascript" },
	exclude_name = { "package.json" },
	icons = true,
	icon_custom_colors = false,
	icon_separator_active = "▎",
	icon_separator_inactive = "▎",
	icon_close_tab = "",
	icon_close_tab_modified = "●",
	icon_pinned = "車",
	insert_at_end = false,
	insert_at_start = false,
	maximum_padding = 1,
	maximum_length = 30,
	semantic_letters = true,
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
	no_name_title = nil,
})
