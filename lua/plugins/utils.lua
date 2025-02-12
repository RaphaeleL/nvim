return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            { "isak102/telescope-git-file-history.nvim", lazy = true },
        },
        lazy = true,
        keys = {
            { "<leader>sf",      ":Telescope find_files theme=ivy<cr>",                                          desc = " Telescope: [S]how [F]uzzy File Finder", },
            { "<leader>sl",      ":Telescope live_grep theme=ivy<cr>",                                           desc = " Telescope: [S]how [L]ive Grep", },
            { "<leader>sd",      ":Telescope diagnostics theme=ivy<cr>",                                         desc = " Telescope: [S]how [D]iagnostics", },
            { "<leader>sb",      ":Telescope buffers theme=ivy<cr>",                                             desc = " Telescope: [S]how Buffers", },
            { "<leader>sk",      ":Telescope keymaps theme=ivy<cr>",                                             desc = " Telescope: [S]how [K]eymaps", },
            { "<leader>sg",      ":Telescope git_files theme=ivy<cr>",                                           desc = " Telescope: [S]how [G]it Files", },
            { "<leader>sc",      ":Telescope git_commits theme=ivy<cr>",                                         desc = " Telescope: [S]how Git [C]ommits", },
            { "<leader>sh",      ":lua require('telescope').extensions.git_file_history.git_file_history()<cr>", desc = " Telescope: [S]how Git [H]istory of File", },

            { "<leader><space>", ":Telescope find_files theme=ivy<cr>",                                          desc = " Telescope: [S]how [F]uzzy File Finder", },
            { "<leader>/",       ":Telescope live_grep theme=ivy<cr>",                                           desc = " Telescope: [S]how [L]ive Grep", },
            { "<leader>,",       ":Telescope buffers theme=ivy<cr>",                                             desc = " Telescope: [S]how Buffers", },
            { "<leader>.",       ":Telescope diagnostics theme=ivy<cr>",                                         desc = " Telescope: [S]how [D]iagnostics", },
        },
        opts = {
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    ".DS_Store",
                    ".git",
                    "%.png",
                    "%.jpg",
                    "%.jpeg",
                }
            },
            pickers = {
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
        "ThePrimeagen/harpoon",
        lazy = true,
        branch = "harpoon2",
        keys = {
            { "<leader>ha", function() require('harpoon'):list():add() end,                                    desc = "[H]arpoon [A]dd" },
            { "<leader>hm", function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, desc = "[H]arpoon [A]dd" },
            { "<leader>h1", function() require('harpoon'):list():select(1) end,                                desc = "[H]arpoon [1] Window" },
            { "<leader>h2", function() require('harpoon'):list():select(2) end,                                desc = "[H]arpoon [2] Window" },
            { "<leader>h3", function() require('harpoon'):list():select(3) end,                                desc = "[H]arpoon [3] Window" },
            { "<leader>h4", function() require('harpoon'):list():select(4) end,                                desc = "[H]arpoon [4] Window" },
            { "F",          function() require('harpoon'):list():next() end,                                   desc = "Harpoon [F]orward" },
            { "B",          function() require('harpoon'):list():prev() end,                                   desc = "Harpoon [B]ackward" }
        },
        init = function()
            local harpoon = require("harpoon")
            harpoon:setup()
        end,
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
        "stevearc/oil.nvim",
        opts = {
            skip_confirm_for_simple_edits = true,
            experimental_watch_for_changes = false,
            use_default_keymaps = true,
            columns = {
                -- "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            view_options = {
                show_hidden = true,
                natural_order = true,
            },
        },
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
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        keys = {
            { "<leader>f", ":NvimTreeToggle<cr>", desc = "[F]ile Explorer" },
        },
        opts = {
            hijack_directories = {
                enable = false,
                auto_open = false
            },
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
            filters = { custom = { "^.git$" } },
            renderer = {
                -- root_folder_modifier = ":t",
                full_name = true,
                group_empty = true,
                indent_markers = {
                    enable = true,
                },
                icons = {
                    show = {
                        file = false,
                        folder = false,
                        folder_arrow = false,
                        git = false,
                        modified = false,
                        hidden = false,
                        diagnostics = false,
                        bookmarks = false,
                    },
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
                enable = false,
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
                float = {
                    enable = true,
                    open_win_config = function()
                        local WIDTH_RATIO = 0.3
                        local HEIGHT_RATIO = 0.925
                        local OFFSET = 3
                        local screen_w = vim.opt.columns:get()
                        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                        local window_w = screen_w * WIDTH_RATIO
                        local window_h = screen_h * HEIGHT_RATIO
                        local window_w_int = math.floor(window_w)
                        local window_h_int = math.floor(window_h)

                        local col_right_aligned = screen_w - window_w_int - OFFSET
                        local row_offset = OFFSET - 3

                        return {
                            border = 'rounded',
                            relative = 'editor',
                            row = row_offset,
                            col = col_right_aligned,
                            width = window_w_int,
                            height = window_h_int,
                        }
                    end,
                },
            },
        }
    }
}
