local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	require("user.notify").message("Could not load lualine", "Loading Error", "error")
	return
end

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

local colors = {
	blue = "#80a0ff",
	cyan = "#79dac8",
	black = "#1E1E1E", -- "#282828",  "#272C34"
	white = "#c6c6c6",
	red = "#ff5189",
	violet = "#d183e8",
	grey = "#303030",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.black, bg = colors.black },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}

lualine.setup({
	-- options = {
	-- 	icons_enabled = true,
	-- 	theme = "onedark",
	-- 	component_separators = { left = "", right = "" },
	-- 	section_separators = { left = "", right = "" },
	-- 	disabled_filetypes = {},
	-- 	always_divide_middle = true,
	-- },
	options = {
		theme = bubbles_theme,
		component_separators = "|",
		section_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
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
			-- { gps.get_location, cond = gps.is_available }
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
				"progress",
				padding = { left = 0, right = 0 },
				color = { fg = "#ECBE7B", bg = "#202328" },
				cond = nil,
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
