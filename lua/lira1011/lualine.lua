local lualine = require("lualine")

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 70
	end,
}

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

-- vim.g.gitblame_display_virtual_text = 0
-- local git_blame = require("gitblame")

lualine.setup({
	options = {
		theme = "kanagawa",
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{
				function()
					return " "
				end,
				padding = { left = 0, right = 0 },
				color = {},
				cond = nil,
			},
		},
		lualine_b = {
			{
				"b:gitsigns_head",
				icon = " ",
				color = {},
				cond = conditions.hide_in_width,
			},
			{
				"filename",
				color = {},
				cond = nil,
			},
		},
		lualine_c = {
			-- { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
		},
		lualine_x = {},
		lualine_y = {
			{
				"diff",
				source = diff_source,
				symbols = { added = "+", modified = "~", removed = "-" },
				diff_color = {
					added = { fg = "#98be65" },
					modified = { fg = "#ECBE7B" },
					removed = { fg = "#ec5f67" },
				},
				color = {},
				cond = nil,
			},
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				color = {},
				cond = conditions.hide_in_width,
			},
			{ "filetype", cond = conditions.hide_in_width, color = {} },
		},
		lualine_z = {
			{
				"location",
				padding = { left = 0, right = 0 },
				color = { fg = "#ECBE7B", bg = "#202328" },
				cond = nil,
			},
			-- {
			-- 	"progress",
			-- 	padding = { left = 0, right = 0 },
			-- 	color = { fg = "#98be65", bg = "#202328" },
			-- 	cond = nil,
			-- },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "getlocation" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
