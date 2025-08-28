require("copilot").setup({
	suggestion = {
		enabled = not true,
		auto_trigger = true,
		hide_during_completion = false,
		keymap = {
			accept = "<M-l>",
			next = "<M-n>",
			prev = "<M-p>",
		},
	},
	panel = { enabled = not true },
	filetypes = {
		markdown = true,
		yaml = true,
		help = true,
	},
})

require("rose-pine").setup({
	variant = "auto",
	dark_variant = "moon",
	dim_inactive_windows = true,
	extend_background_behind_borders = true,
	dim_nc_background = true,
	disable_background = true,
	styles = {
		bold = true,
		italic = true,
		transparency = true,
	},
	groups = {},
	highlight_groups = {
		Normal = { bg = "NONE" },
		NormalNC = { bg = "NONE" },
		NormalFloat = { bg = "NONE" },
		StatusLine = { bg = "NONE" },
		StatusLineNC = { bg = "NONE" },
		CursorLineNr = { fg = "gold" },
	},
})
vim.cmd("colorscheme rose-pine")

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"vimdoc",
		"javascript",
		"typescript",
		"c",
		"lua",
		"python",
		"yaml",
		"bash",
		"make",
	},
	sync_install = false,
	auto_install = true,
	indent = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = function(lang, buf)
			if lang == "html" then
				print("disabled")
				return true
			end
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				vim.notify(
					"File larger than 100KB treesitter disabled for performance",
					vim.log.levels.WARN,
					{ title = "Treesitter" }
				)
				return true
			end
		end,
		additional_vim_regex_highlighting = { "markdown" },
	},
})

vim.opt.laststatus = 2
vim.opt.cmdheight = 1

local mode_map = {
	["n"] = "N", -- Normal Mode
	["i"] = "I", -- Insert Mode
	["v"] = "V", -- Visual Mode
	["V"] = "VL", -- Visual Line Mode
	[""] = "VB", -- Visual Block Mode
	["c"] = "C", -- Command Mode
	["R"] = "R", -- Replace Mode
	["t"] = "T", -- Terminal Mode
}

local custom_rosepine = require("lualine.themes.rose-pine-alt")
custom_rosepine.normal.a.bg = "NONE"
custom_rosepine.normal.b.bg = "NONE"
custom_rosepine.normal.c.bg = "NONE"
custom_rosepine.insert.a.bg = "NONE"
custom_rosepine.visual.a.bg = "NONE"
custom_rosepine.command.a.bg = "NONE"
custom_rosepine.replace.a.bg = "NONE"
custom_rosepine.inactive.a.bg = "NONE"
custom_rosepine.inactive.b.bg = "NONE"
custom_rosepine.inactive.c.bg = "NONE"

require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = custom_rosepine,
		component_separators = "",
		section_separators = "",
		ignore_focus = {},
	},
	sections = {
		lualine_a = {
			function()
				local mode = vim.fn.mode()
				return mode_map[mode] or mode
			end,
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			-- "%=",
			{
				"filename",
				path = 1,
				-- 0: Just the filename
				-- 1: Relative path
				-- 2: Absolute path
				-- 3: Absolute path, with tilde as the home directory
				-- 4: Filename and parent dir, with tilde as the home directory
			},
		},
		lualine_x = {},
		lualine_y = { "filetype" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})

require("visual-whitespace").setup({
	highlight = { link = "Visual" },
	space_char = "·",
	tab_char = "→",
	nl_char = "↲",
	cr_char = "←",
})

local mc = require("multicursor-nvim")
mc.setup()

vim.api.nvim_set_hl(0, "MultiCursorCursor", { reverse = true })
vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
vim.api.nvim_set_hl(0, "MultiCursorSign", { link = "SignColumn" })
vim.api.nvim_set_hl(0, "MultiCursorMatchPreview", { link = "Search" })
vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { reverse = true })
vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
vim.api.nvim_set_hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })

vim.keymap.set("n", "mj", function()
	require("multicursor-nvim").lineAddCursor(1)
end)
vim.keymap.set("x", "mj", function()
	require("multicursor-nvim").lineAddCursor(1)
end)
vim.keymap.set("n", "mk", function()
	require("multicursor-nvim").lineAddCursor(-1)
end)
vim.keymap.set("x", "mk", function()
	require("multicursor-nvim").lineAddCursor(-1)
end)
vim.keymap.set("n", "mc", function()
	require("multicursor-nvim").clearCursors()
end)
vim.keymap.set("x", "mc", function()
	require("multicursor-nvim").clearCursors()
end)
vim.keymap.set("n", "mm", function()
	require("multicursor-nvim").matchCursors()
end)
vim.keymap.set("x", "mm", function()
	require("multicursor-nvim").matchCursors()
end)

require("nvim_comment").setup()
vim.keymap.set({ "n", "v" }, "<Leader>l", ":CommentToggle<cr>")

require("grug-far").setup({})
vim.keymap.set("n", "<leader>gr", ":GrugFar<cr>")

require("snacks").setup({
	picker = {
		icons = {
			files = { enabled = false },
			keymaps = { nowait = "" },
			tree = {
				vertical = "│ ",
				middle = "├╴",
				last = "└╴",
			},
			undo = { saved = "" },
			ui = {
				live = "󰐰 ",
				hidden = "h",
				ignored = "i",
				follow = "f",
				selected = "● ",
				unselected = "○ ",
				-- selected = " ",
			},
			git = { enabled = false },
			diagnostics = {
				Error = "",
				Warn = "",
				Hint = "",
				Info = "",
			},
			lsp = {
				unavailable = "",
				enabled = "",
				disabled = "",
				attached = "",
			},
			kinds = {},
		},
		files = {
			hidden = true,
			ignored = false,
		},
		enabled = true,
		layout = {
			preset = "ivy",
			border = "none",
		},
		sources = {
			explorer = { layout = { layout = { position = "right" } } },
		},
		win = { list = { keys = { ["<TAB>"] = "confirm" } } },
	},
	bigfile = { enabled = true },
	input = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	dashboard = { enabled = false },
	scroll = { enabled = false },
	indent = { enabled = false },
	notifier = { enabled = false },
	statuscolumn = { enabled = false },
	words = { enabled = false },
	explorer = {
		enabled = true,
		replace_netrw = false, -- Oil is doing this
	},
})

vim.keymap.set("n", "<leader><space>", function()
	Snacks.picker.smart()
end)
vim.keymap.set("n", "<leader>d", function()
	Snacks.picker.diagnostics()
end)
vim.keymap.set("n", "<leader>b", function()
	Snacks.picker.buffers()
end)
vim.keymap.set("n", "<leader>/", function()
	Snacks.picker.grep()
end)
vim.keymap.set("n", "<leader>sd", function()
	Snacks.picker.diagnostics()
end)
vim.keymap.set("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end)
vim.keymap.set("n", "<leader>su", function()
	Snacks.picker.undo()
end)
vim.keymap.set("n", "<leader>se", function()
	Snacks.picker.explorer()
end)
vim.keymap.set("n", "gd", function()
	Snacks.picker.lsp_definitions()
end)
vim.keymap.set("n", "gD", function()
	Snacks.picker.lsp_declarations()
end)
vim.keymap.set("n", "gr", function()
	Snacks.picker.lsp_references()
end)
vim.keymap.set("n", "gi", function()
	Snacks.picker.lsp_implementations()
end)
vim.keymap.set("n", "gt", function()
	Snacks.picker.lsp_type_definitions()
end)
vim.keymap.set("n", "<leader>ss", function()
	Snacks.picker.lsp_symbols()
end)
vim.keymap.set("n", "<leader>sf", function()
	Snacks.picker.smart()
end)
vim.keymap.set("n", "<leader>sb", function()
	Snacks.picker.buffers()
end)
vim.keymap.set("n", "<leader>sf", function()
	Snacks.picker.files()
end)
vim.keymap.set("n", "<leader>sg", function()
	Snacks.picker.git_files()
end)
vim.keymap.set("n", "<leader>sr", function()
	Snacks.picker.recent()
end)
vim.keymap.set("n", "<leader>sl", function()
	Snacks.picker.grep()
end)
vim.keymap.set("n", "<leader>gs", function()
	Snacks.picker.git_files()
end)
vim.keymap.set("n", "<leader>gb", function()
	Snacks.picker.git_branches()
end)
vim.keymap.set("n", "<leader>gl", function()
	Snacks.picker.git_log()
end)
vim.keymap.set("n", "<leader>gf", function()
	Snacks.picker.git_log_file()
end)
vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end)
vim.keymap.set("n", "<leader>s/", function()
	Snacks.picker.search_history()
end)
vim.keymap.set("n", "<leader>sc", function()
	Snacks.picker.command_history()
end)
vim.keymap.set("n", "<leader>uC", function()
	Snacks.picker.colorschemes()
end)

local function has_words_before()
	local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local icon_provider, hl_provider

local function get_kind_icon(CTX)
	if not icon_provider then
		if not icon_provider then
			local lspkind_avail, lspkind = pcall(require, "lspkind")
			if lspkind_avail then
				icon_provider = function(ctx)
					if ctx.item.source_name == "LSP" then
						local icon = lspkind.symbolic(ctx.kind, { mode = "symbol" })
						if icon then
							ctx.kind_icon = icon
						end
					elseif ctx.item.source_name == "Snippets" then
						local icon = lspkind.symbolic("snippet", { mode = "symbol" })
						if icon then
							ctx.kind_icon = icon
						end
					end
				end
			end
		end
		if not icon_provider then
			icon_provider = function() end
		end
	end
	if not hl_provider then
		local highlight_colors_avail, highlight_colors = pcall(require, "nvim-highlight-colors")
		if highlight_colors_avail then
			local kinds
			hl_provider = function(ctx)
				if not kinds then
					kinds = require("blink.cmp.types").CompletionItemKind
				end
				if ctx.item.kind == kinds.Color then
					local doc = vim.tbl_get(ctx, "item", "documentation")
					if doc then
						local color_item = highlight_colors_avail
							and highlight_colors.format(doc, { kind = kinds[kinds.Color] })
						if color_item and color_item.abbr_hl_group then
							if color_item.abbr then
								ctx.kind_icon = color_item.abbr
							end
							ctx.kind_hl = color_item.abbr_hl_group
						end
					end
				end
			end
		end
		if not hl_provider then
			hl_provider = function() end
		end
	end
	icon_provider(CTX)
	hl_provider(CTX)
	return { text = CTX.kind_icon .. CTX.icon_gap, highlight = CTX.kind_hl }
end

require("blink.cmp").setup({
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "copilot" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-cmp-copilot",
				score_offset = 100,
				async = true,
			},
		},
	},
	keymap = {
		["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<C-N>"] = { "select_next", "show" },
		["<C-P>"] = { "select_prev", "show" },
		["<C-J>"] = { "select_next", "fallback" },
		["<C-K>"] = { "select_prev", "fallback" },
		["<C-U>"] = { "scroll_documentation_up", "fallback" },
		["<C-D>"] = { "scroll_documentation_down", "fallback" },
		["<C-e>"] = { "hide", "fallback" },
		["<CR>"] = { "accept", "fallback" },
		["<Tab>"] = {
			"snippet_forward",
			"select_next",
			function(cmp)
				if has_words_before() or vim.api.nvim_get_mode().mode == "c" then
					return cmp.show()
				end
			end,
			"fallback",
		},
		["<S-Tab>"] = {
			"snippet_backward",
			"select_prev",
			function(cmp)
				if vim.api.nvim_get_mode().mode == "c" then
					return cmp.show()
				end
			end,
			"fallback",
		},
	},
	fuzzy = {
		implementation = "lua",
	},
	completion = {
		list = { selection = { preselect = false, auto_insert = true } },
		menu = {
			auto_show = function(ctx)
				return ctx.mode ~= "cmdline"
			end,
			border = "rounded",
			winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
			draw = {
				treesitter = { "lsp" },
				components = {
					kind_icon = {
						text = function(ctx)
							return get_kind_icon(ctx).text
						end,
						highlight = function(ctx)
							return get_kind_icon(ctx).highlight
						end,
					},
				},
			},
		},
		accept = {
			auto_brackets = { enabled = true },
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 0,
			window = {
				border = "rounded",
				winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
			},
		},
	},
	signature = {
		window = {
			border = "rounded",
			winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
		},
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
})

-- Format buffer
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[F]ormat buffer" })

-- Format range (works in normal + visual mode)
vim.keymap.set({ "n", "v" }, "<leader>rf", function()
	local mode = vim.fn.mode()
	local start_pos, end_pos

	-- Support for visual selection
	if mode == "v" or mode == "V" or mode == "\22" then -- \22 is CTRL-V (visual block)
		-- Get visual selection range
		vim.cmd("normal! \\<Esc>")
		start_pos = vim.fn.getpos("'<")
		end_pos = vim.fn.getpos("'>")

		local start_line = start_pos[2] - 1
		local end_line = end_pos[2] - 1
		local end_col = #vim.fn.getline(end_line + 1)

		require("conform").format({
			async = true,
			lsp_format = "fallback",
			range = {
				start = { start_line, 0 },
				["end"] = { end_line, end_col },
			},
		})
	else
		require("conform").format({
			async = true,
			lsp_format = "fallback",
		})
	end
end, { desc = "[F]ormat selected range" })

require("oil").setup({
	default_file_explorer = true,
	skip_confirm_for_simple_edits = true,
	experimental_watch_for_changes = false,
	use_default_keymaps = true,
	columns = {
		"permissions",
		"size",
		"mtime",
	},
	view_options = {
		show_hidden = true,
		natural_order = true,
	},
})

-- local harpoon = require("harpoon")
-- harpoon:setup()
--
-- -- Harpoon keymaps
-- vim.keymap.set("n", "<leader>ha", function()
-- 	require("harpoon"):list():add()
-- end, { desc = "[H]arpoon [A]dd" })
--
-- vim.keymap.set("n", "<leader>hm", function()
-- 	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
-- end, { desc = "[H]arpoon [M]enu" })
--
-- vim.keymap.set("n", "<leader>1", function()
-- 	require("harpoon"):list():select(1)
-- end, { desc = "[H]arpoon [1] Window" })
--
-- vim.keymap.set("n", "<leader>2", function()
-- 	require("harpoon"):list():select(2)
-- end, { desc = "[H]arpoon [2] Window" })
--
-- vim.keymap.set("n", "<leader>3", function()
-- 	require("harpoon"):list():select(3)
-- end, { desc = "[H]arpoon [3] Window" })
--
-- vim.keymap.set("n", "<leader>4", function()
-- 	require("harpoon"):list():select(4)
-- end, { desc = "[H]arpoon [4] Window" })
--
-- vim.keymap.set("n", "<leader>5", function()
-- 	require("harpoon"):list():select(5)
-- end, { desc = "[H]arpoon [5] Window" })
--
-- vim.keymap.set("n", "F", function()
-- 	require("harpoon"):list():next()
-- end, { desc = "Harpoon [F]orward" })
--
-- vim.keymap.set("n", "B", function()
-- 	require("harpoon"):list():prev()
-- end, { desc = "Harpoon [B]ackward" })

require("noice").setup({
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    },
    cmdline = {
        enabled = true,
        view = "cmdline",
        opts = {},
        format = {
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
            input = { view = "cmdline_input", icon = "󰥻 " },
        },
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
            progress = {
                enabled = true,
                format = "lsp_progress",
                format_done = "lsp_progress_done",
                throttle = 1000 / 30,
                view = "mini",
            }
        }
    }
})

