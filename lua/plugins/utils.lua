return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"isak102/telescope-git-file-history.nvim",
		},
		lazy = true,
		keys = {
			{
				"<leader>sf",
				":Telescope find_files<cr>",
				desc = " Telescope: [S]how [F]uzzy File Finder",
			},
			{
				"<leader>sl",
				":Telescope live_grep<cr>",
				desc = " Telescope: [S]how [L]ive Grep",
			},
			{
				"<leader>sg",
				":Telescope git_files<cr>",
				desc = " Telescope: [S]how [G]it Files",
			},
			{
				"<leader>sd",
				":Telescope diagnostics<cr>",
				desc = " Telescope: [S]how [D]iagnostics",
			},

			{
				"<leader>sb",
				":Telescope buffers<cr>",
				desc = " Telescope: [S]how Buffers",
			},
			{
				"<leader>sk",
				":Telescope keymaps<cr>",
				desc = " Telescope: [S]how [K]eymaps",
			},

			{
				"<leader>sh",
				":lua require('telescope').extensions.git_file_history.git_file_history()<cr>",
				desc = " Telescope: [S]how Git [H]istory of File",
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						".DS_Store",
						".git",
					},
				},
				pickers = {
					find_files = {
						theme = "ivy",
					},
					colorscheme = {
						enable_preview = true,
					},
				},
			})
		end,
	},
	{
		"terrortylor/nvim-comment",
		event = "VeryLazy",
		config = function()
			require("nvim_comment").setup()
		end,
		keys = {
			{ "<Leader>l", ":CommentToggle<cr>" },
		},
	},
	{
		"nvim-pack/nvim-spectre",
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
		keys = {
			{
				"<leader>S",
				function()
					require("spectre").open()
				end,
				desc = "Search and Replace in files",
			},
		},
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>dd",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>db",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>ds",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>dD",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>dl",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>dq",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		keys = {
			{ "<leader>g", ":lua require('neogen').generate()<cr>", desc = "Generate Docstring" },
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"Theprimeagen/harpoon",
		lazy = true,
		keys = {
			{ "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "[H]arpoon: [M]enu" },
			{ "<leader>ha", ":lua require('harpoon.mark').add_file()<cr>", desc = "[H]arpoon: [A]dd File" },

			{ "F", ":lua require('harpoon.ui').nav_next()<cr>", desc = "[H]arpoon: [N]ext" },
			{ "B", ":lua require('harpoon.ui').nav_prev()<cr>", desc = "[H]arpoon: [P]rev" },
		},
	},
	{
		"mbbill/undotree",
		lazy = true,
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "[U]ndotree" },
		},
	},
	{
		"NStefan002/visual-surround.nvim",
		event = "InsertEnter",
		config = true,
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		opts = {},
	},
	{
		"theKnightsOfRohan/csvlens.nvim",
		keys = {
			{ "<leader>c", ":Csvlens<cr>", desc = "[C]svlens" },
		},
		config = true,
		opts = {},
	},
	{
		"stevearc/oil.nvim",
		opts = {
			-- columns = {
			--     "icon",
			--     "permissions",
			--     "size",
			--     "mtime",
			-- },
			skip_confirm_for_simple_edits = true,
			experimental_watch_for_changes = false,
			use_default_keymaps = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
			},
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		keys = {
			{ "<leader>f", ":NvimTreeToggle<cr>", desc = "[F]ile Explorer" },
		},
		opts = {
			hijack_directories = {
				enable = false,
				auto_open = false,
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			renderer = {
				root_folder_modifier = ":t",
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_open = "",
							arrow_closed = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							untracked = "U",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			view = {
				width = 40,
				side = "right",
			},
		},
	},
}
