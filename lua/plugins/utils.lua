return {

    --     "nvim-telescope/telescope.nvim",
    --     cmd = "Telescope",
    --     dependencies = {
    --         { "isak102/telescope-git-file-history.nvim", lazy = true },
    --     },
    --     lazy = true,
    --     keys = {
    --         { "<leader>sf", ":Telescope find_files<cr>",                                                    desc = " Telescope: [S]how [F]uzzy File Finder", },
    --         { "<leader>sl", ":Telescope live_grep<cr>",                                                     desc = " Telescope: [S]how [L]ive Grep", },
    --         { "<leader>sg", ":Telescope git_files<cr>",                                                     desc = " Telescope: [S]how [G]it Files", },
    --         { "<leader>sd", ":Telescope diagnostics<cr>",                                                   desc = " Telescope: [S]how [D]iagnostics", },
    --
    --         { "<leader>sb", ":Telescope buffers<cr>",                                                       desc = " Telescope: [S]how Buffers", },
    --         { "<leader>sk", ":Telescope keymaps<cr>",                                                       desc = " Telescope: [S]how [K]eymaps", },
    --
    --         { "<leader>sh", ":lua require('telescope').extensions.git_file_history.git_file_history()<cr>", desc = " Telescope: [S]how Git [H]istory of File", },
    --     },
    --     opts = {
    --         defaults = {
    --             file_ignore_patterns = {
    --                 "node_modules",
    --                 ".DS_Store",
    --                 ".git",
    --                 "%.png",
    --                 "%.jpg",
    --                 "%.jpeg",
    --             },
    --         },
    --         pickers = {
    --             -- find_files = {
    --             -- 	theme = "ivy",
    --             -- },
    --             -- colorscheme = {
    --             -- 	enable_preview = true,
    --             -- },
    --         },
    --     },
    -- },
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
    -- {
    --     "windwp/nvim-autopairs",
    --     event = "InsertEnter",
    --     opts = {},
    -- },
    {
        "ThePrimeagen/harpoon",
        -- event = { "BufReadPost", "BufNewFile" },
        lazy = true,
        branch = "harpoon2",
        keys = {
            { "<leader>ha", function() require('harpoon'):list():add() end },
            { "<leader>hm", function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end },
            { "F",          function() require('harpoon'):list():next() end },
            { "B",          function() require('harpoon'):list():prev() end },
            { "<leader>ha", function() require('harpoon'):list():select(1) end },
            { "<leader>hs", function() require('harpoon'):list():select(2) end },
            { "<leader>hd", function() require('harpoon'):list():select(3) end },
            { "<leader>hf", function() require('harpoon'):list():select(4) end }
        },
        init = function()
            local harpoon = require("harpoon")
            harpoon:setup()
        end,
    },
    -- {
    --     "mbbill/undotree",
    --     lazy = true,
    --     keys = {
    --         { "<leader>u", ":UndotreeToggle<cr>", desc = "[U]ndotree" },
    --     },
    -- },
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
            { "<leader>sr", ":GrugFar<cr>", desc = "Search and Replace in files" },
        },
    },

    {
        "folke/snacks.nvim",
        lazy = true,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            input = { enabled = true },
            picker = {
                enabled = true,
                layout = {
                    preset = 'ivy',
                    border = "none"
                },
            },
            quickfile = { enabled = true },
            scope = { enabled = true },
            dashboard = { enabled = false },
            scroll = { enabled = false },
            indent = { enabled = false },
            notifier = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
        },
        keys = {
            -- Old Keybinds
            { "<leader>sf",      function() Snacks.picker.smart() end,                desc = "Smart Find Files" },
            { "<leader>sb",      function() Snacks.picker.buffers() end,              desc = "Buffers" },
            { "<leader>sg",      function() Snacks.picker.git_files() end,            desc = "Find Git Files" },
            -- Pickers
            { "<leader><space>", function() Snacks.picker.smart() end,                desc = "Smart Find Files" },
            { "<leader>,",       function() Snacks.picker.buffers() end,              desc = "Buffers" },
            { "<leader>/",       function() Snacks.picker.grep() end,                 desc = "Grep" },
            -- Find
            { "<leader>fb",      function() Snacks.picker.buffers() end,              desc = "Buffers" },
            { "<leader>ff",      function() Snacks.picker.files() end,                desc = "Find Files" },
            { "<leader>fg",      function() Snacks.picker.git_files() end,            desc = "Find Git Files" },
            { "<leader>fr",      function() Snacks.picker.recent() end,               desc = "Recent" },
            -- LSP
            { "gd",              function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition" },
            { "gD",              function() Snacks.picker.lsp_declarations() end,     desc = "Goto Declaration" },
            { "gr",              function() Snacks.picker.lsp_references() end,       nowait = true,                  desc = "References" },
            { "gi",              function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
            { "gt",              function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
            { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,          desc = "LSP Symbols" },
            -- Git
            { "<leader>gs",      function() Snacks.picker.git_files() end,            desc = "Find Git Files" },
            { "<leader>gb",      function() Snacks.picker.git_branches() end,         desc = "Git Branches" },
            { "<leader>gl",      function() Snacks.picker.git_log() end,              desc = "Git Log" },
            { "<leader>gf",      function() Snacks.picker.git_log_file() end,         desc = "Git Log File" },
            { "<leader>gg",      function() Snacks.lazygit() end,                     desc = "Lazygit" },
            -- Grep
            { "<leader>sb",      function() Snacks.picker.lines() end,                desc = "Buffer Lines" },
            { "<leader>sl",      function() Snacks.picker.grep() end,                 desc = "Grep" },
            -- Search
            { '<leader>s/',      function() Snacks.picker.search_history() end,       desc = "Search History" },
            { "<leader>sc",      function() Snacks.picker.command_history() end,      desc = "Command History" },
            { "<leader>sd",      function() Snacks.picker.diagnostics() end,          desc = "Diagnostics" },
            { "<leader>sk",      function() Snacks.picker.keymaps() end,              desc = "Keymaps" },
            { "<leader>su",      function() Snacks.picker.undo() end,                 desc = "Undo History" },
            { "<leader>uC",      function() Snacks.picker.colorschemes() end,         desc = "Colorschemes" },
        },
    }

}
