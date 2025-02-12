return {
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
    -- {
    --     "folke/trouble.nvim",
    --     opts = {},
    --     cmd = "Trouble",
    --     keys = {
    --         { "<leader>dd", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "Diagnostics (Trouble)", },
    --         { "<leader>db", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "Buffer Diagnostics (Trouble)", },
    --         { "<leader>ds", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Symbols (Trouble)", },
    --         { "<leader>dD", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)", },
    --         { "<leader>dl", "<cmd>Trouble loclist toggle<cr>",                            desc = "Location List (Trouble)", },
    --         { "<leader>dq", "<cmd>Trouble qflist toggle<cr>",                             desc = "Quickfix List (Trouble)", },
    --     },
    -- },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "mbbill/undotree",
        lazy = true,
        keys = {
            { "<leader>u", ":UndotreeToggle<cr>", desc = "[U]ndotree" },
        },
    },
    {
        "NStefan002/visual-surround.nvim",
        event = "InsertEnter",
        config = true,
    },
    {
        "MagicDuck/grug-far.nvim",
        config = function()
            require("grug-far").setup({})
        end,
        keys = {
            { "<leader>gr", ":GrugFar<cr>", desc = "Search and Replace in files" },
        },
    },
    -- {
    -- 	"folke/snacks.nvim",
    -- 	lazy = true,
    -- 	---@type snacks.Config
    -- 	opts = {
    -- 		bigfile = { enabled = true },
    -- 		input = { enabled = true },
    -- 		picker = {
    -- 			enabled = true,
    -- 			layout = {
    -- 				preset = 'ivy',
    -- 				border = "none"
    -- 			},
    -- 		},
    -- 		quickfile = { enabled = true },
    -- 		scope = { enabled = true },
    -- 		dashboard = { enabled = false },
    -- 		scroll = { enabled = false },
    -- 		indent = { enabled = false },
    -- 		notifier = { enabled = false },
    -- 		statuscolumn = { enabled = false },
    -- 		words = { enabled = false },
    -- 	},
    -- 	keys = {
    -- 		-- Pickers
    -- 		{ "<leader><space>", function() Snacks.picker.smart() end,                desc = "Smart Find Files" },
    -- 		{ "<leader>sf",      function() Snacks.picker.smart() end,                desc = "Smart Find Files" },
    -- 		{ "<leader>,",       function() Snacks.picker.buffers() end,              desc = "Buffers" },
    -- 		{ "<leader>/",       function() Snacks.picker.grep() end,                 desc = "Grep" },
    -- 		-- Find
    -- 		{ "<leader>sb",      function() Snacks.picker.buffers() end,              desc = "Buffers" },
    -- 		{ "<leader>sf",      function() Snacks.picker.files() end,                desc = "Find Files" },
    -- 		{ "<leader>sg",      function() Snacks.picker.git_files() end,            desc = "Find Git Files" },
    -- 		{ "<leader>sr",      function() Snacks.picker.recent() end,               desc = "Recent" },
    -- 		{ "<leader>sl",      function() Snacks.picker.grep() end,                 desc = "Grep" },
    -- 		-- LSP
    -- 		{ "gd",              function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition" },
    -- 		{ "gD",              function() Snacks.picker.lsp_declarations() end,     desc = "Goto Declaration" },
    -- 		{ "gr",              function() Snacks.picker.lsp_references() end,       nowait = true,                  desc = "References" },
    -- 		{ "gi",              function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
    -- 		{ "gt",              function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    -- 		{ "<leader>ss",      function() Snacks.picker.lsp_symbols() end,          desc = "LSP Symbols" },
    -- 		-- Git
    -- 		{ "<leader>gs", function() Snacks.picker.git_files() end,       desc = "Find Git Files" },
    -- 		{ "<leader>gb", function() Snacks.picker.git_branches() end,    desc = "Git Branches" },
    -- 		{ "<leader>gl", function() Snacks.picker.git_log() end,         desc = "Git Log" },
    -- 		{ "<leader>gf", function() Snacks.picker.git_log_file() end,    desc = "Git Log File" },
    -- 		-- { "<leader>gg",      function() Snacks.lazygit() end,                     desc = "Lazygit" },
    -- 		-- Search
    -- 		{ '<leader>s/', function() Snacks.picker.search_history() end,  desc = "Search History" },
    -- 		{ "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
    -- 		{ "<leader>sd", function() Snacks.picker.diagnostics() end,     desc = "Diagnostics" },
    -- 		{ "<leader>sk", function() Snacks.picker.keymaps() end,         desc = "Keymaps" },
    -- 		{ "<leader>su", function() Snacks.picker.undo() end,            desc = "Undo History" },
    -- 		{ "<leader>uC", function() Snacks.picker.colorschemes() end,    desc = "Colorschemes" },
    -- 	},
    -- }
}
