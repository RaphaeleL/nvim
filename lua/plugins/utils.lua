return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			{ "isak102/telescope-git-file-history.nvim", lazy = true },
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
		opts = {
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
		},
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
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"ThePrimeagen/harpoon",
		event = { "BufReadPost", "BufNewFile" },
		branch = "harpoon2",
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<leader>hm", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)
			vim.keymap.set("n", "F", function()
				harpoon:list():next()
			end)
			vim.keymap.set("n", "B", function()
				harpoon:list():prev()
			end)

			harpoon:setup({})

			-- local conf = require("telescope.config").values
			-- local function toggle_telescope(harpoon_files)
			-- 	local file_paths = {}
			-- 	for _, item in ipairs(harpoon_files.items) do
			-- 		table.insert(file_paths, item.value)
			-- 	end
			--
			-- 	require("telescope.pickers")
			-- 		.new({}, {
			-- 			prompt_title = "Harpoon",
			-- 			finder = require("telescope.finders").new_table({
			-- 				results = file_paths,
			-- 			}),
			-- 			previewer = conf.file_previewer({}),
			-- 			sorter = conf.generic_sorter({}),
			-- 		})
			-- 		:find()
			-- end
			--
			-- vim.keymap.set("n", "<leader>sp", function()
			-- 	toggle_telescope(harpoon:list())
			-- end, { desc = "Telescope: [S]how Harpoon Window" })

			-- Set <space>1..<space>5 be my shortcuts to moving to the files
			for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
				vim.keymap.set("n", string.format("<space>%d", idx), function()
					harpoon:list():select(idx)
				end)
			end
		end,
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
		"stevearc/oil.nvim",
		opts = {
			skip_confirm_for_simple_edits = true,
			experimental_watch_for_changes = false,
			use_default_keymaps = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
			},
		},
	},
}
