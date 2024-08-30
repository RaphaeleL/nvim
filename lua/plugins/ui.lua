return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = "AndreM222/copilot-lualine",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local group = vim.api.nvim_create_augroup("custom-treesitter", { clear = true })

			---@diagnostic disable-next-line: redundant-parameter
			require("nvim-treesitter").setup({
				ensure_install = { "core", "stable" },
			})

			local syntax_on = {
				elixir = true,
				php = true,
			}

			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				callback = function(args)
					local bufnr = args.buf
					local ft = vim.bo[bufnr].filetype
					pcall(vim.treesitter.start)

					if syntax_on[ft] then
						vim.bo[bufnr].syntax = "on"
					end
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "TSUpdate",
				callback = function()
					local parsers = require("nvim-treesitter.parsers")

					parsers.lua = {
						tier = 0,

						---@diagnostic disable-next-line: missing-fields
						install_info = {
							path = "~/plugins/tree-sitter-lua",
							files = { "src/parser.c", "src/scanner.c" },
						},
					}
				end,
			})
		end,
	},
	{
		"mcauley-penney/visual-whitespace.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			highlight = { link = "Visual" },
			space_char = "·",
			tab_char = "→",
			nl_char = "↲",
			cr_char = "←",
		},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = "InsertEnter",
		opts = {
			render = "background",
			virtual_symbol = "■",
			enable_named_colors = true,
			enable_tailwind = true,
			custom_colors = {
				{ label = "%-%-theme%-primary%-color", color = "#0f1219" },
				{ label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.opt.laststatus = 2
			vim.opt.cmdheight = 1

			local colors = {
				blue = "#80a0ff",
				cyan = "#79dac8",
				black = "#080808",
				white = "#c6c6c6",
				red = "#ff5189",
				violet = "#d183e8",
				grey = "#303030",
				yellow = "#f0c674",
				orange = "#de935f",
			}

			local bubbles_theme = {
				normal = {
					a = { fg = colors.black, bg = colors.orange },
					b = { fg = colors.white, bg = colors.grey },
					c = { fg = colors.white },
				},

				insert = { a = { fg = colors.black, bg = colors.blue } },
				visual = { a = { fg = colors.black, bg = colors.cyan } },
				replace = { a = { fg = colors.black, bg = colors.red } },

				inactive = {
					a = { fg = colors.white, bg = colors.black },
					b = { fg = colors.white, bg = colors.black },
					c = { fg = colors.white },
				},
			}

			require("lualine").setup({
				options = {
					icons_enabled = false,
					theme = bubbles_theme,
					component_separators = "",
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { { "mode", separator = { left = "" } } },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = {
						-- "%=",
						{
							"filename",
							path = 4,
							-- 0: Just the filename
							-- 1: Relative path
							-- 2: Absolute path
							-- 3: Absolute path, with tilde as the home directory
							-- 4: Filename and parent dir, with tilde as the home directory
						},
					},
					lualine_x = {},
					lualine_y = { "copilot", "filetype" },
					lualine_z = {
						{ "location", separator = { right = "" } },
					},
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
		end,
	},
	-- {
	-- 	"tjdevries/express_line.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		vim.opt.laststatus = 2
	-- 		vim.opt.cmdheight = 1
	-- 		vim.opt.showcmd = true
	-- 		require("el").setup({})
	-- 		vim.defer_fn(function()
	-- 			-- NOTE: This is not working in certain filetypes, e.g. Python.
	-- 			vim.cmd([[hi StatusLine guibg=None]])
	-- 			vim.cmd([[hi StatusLineNC guibg=None]])
	-- 		end, 100)
	-- 	end,
	-- },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "<Leader>ue", "<cmd>IBLToggle<CR>", desc = "Toggle indent-lines" },
		},
		config = function()
			if vim.fn.has("nvim-0.10.0") == 0 then
				local utils = require("ibl.utils")
				---@diagnostic disable-next-line: deprecated
				utils.tbl_join = vim.tbl_flatten
			end

			require("ibl").setup({
				indent = {
					char = "│",
					tab_char = "│",
				},
				scope = {
					enabled = true,
					show_start = true,
					show_end = false,
					injected_languages = true,
					show_exact_scope = false,
				},
				exclude = {
					filetypes = {
						"alpha",
						"checkhealth",
						"dashboard",
						"git",
						"gitcommit",
						"help",
						"lazy",
						"lazyterm",
						"lspinfo",
						"man",
						"mason",
						"neo-tree",
						"notify",
						"Outline",
						"TelescopePrompt",
						"TelescopeResults",
						"terminal",
						"toggleterm",
						"Trouble",
					},
				},
			})
		end,
	},
	{
		"RRethy/vim-illuminate",
		opts = {
			delay = 0,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
		},
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
}
