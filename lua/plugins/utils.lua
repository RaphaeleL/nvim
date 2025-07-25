return {
    {
        "jake-stewart/multicursor.nvim",
        lazy = true,
        branch = "1.0",
        config = function()
            local mc = require("multicursor-nvim")
            mc.setup()

            vim.api.nvim_set_hl(0, "MultiCursorCursor", { reverse = true })
            vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
            vim.api.nvim_set_hl(0, "MultiCursorSign", { link = "SignColumn" })
            vim.api.nvim_set_hl(0, "MultiCursorMatchPreview", { link = "Search" })
            vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { reverse = true })
            vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
            vim.api.nvim_set_hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
        end,
        keys = {
            { "mj", function() require("multicursor-nvim").lineAddCursor(1) end },
            { "mj", function() require("multicursor-nvim").lineAddCursor(1) end,  mode = "x" },
            { "mk", function() require("multicursor-nvim").lineAddCursor(-1) end },
            { "mk", function() require("multicursor-nvim").lineAddCursor(-1) end, mode = "x" },
            { "mc", function() require("multicursor-nvim").clearCursors() end },
            { "mc", function() require("multicursor-nvim").clearCursors() end,    mode = "x" },
            { "mm", function() require("multicursor-nvim").matchCursors() end },
            { "mm", function() require("multicursor-nvim").matchCursors() end,    mode = "x" },
        },
    },
    {
        "terrortylor/nvim-comment",
        lazy = true,
        config = function()
            require("nvim_comment").setup()
        end,
        keys = {
            { "<Leader>l", ":CommentToggle<cr>" },            -- normal mode
            { "<Leader>l", ":CommentToggle<cr>", mode = "v" } -- visual mode
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "NStefan002/visual-surround.nvim",
        event = "InsertEnter",
        config = true,
    },
    {
        "MagicDuck/grug-far.nvim",
        lazy = true,
        config = function()
            require("grug-far").setup({})
        end,
        keys = {
            { "<leader>gr", ":GrugFar<cr>", desc = "Search and Replace in files" },
        },
    },
    {
        "folke/snacks.nvim",
        lazy = true,
        ---@type snacks.Config
        opts = {
            picker = {
                icons = {
                    files = { enabled = false, },
                    keymaps = { nowait = "" },
                    tree = {
                        vertical = "│ ",
                        middle   = "├╴",
                        last     = "└╴",
                    },
                    undo = { saved = "", },
                    ui = {
                        live       = "󰐰 ",
                        hidden     = "h",
                        ignored    = "i",
                        follow     = "f",
                        selected   = "● ",
                        unselected = "○ ",
                        -- selected = " ",
                    },
                    git = { enabled = false },
                    diagnostics = {
                        Error = "",
                        Warn  = "",
                        Hint  = "",
                        Info  = "",
                    },
                    lsp = {
                        unavailable = "",
                        enabled = "",
                        disabled = "",
                        attached = ""
                    },
                    kinds = {}
                },
                files = {
                    hidden = true,
                    ignored = false,
                },
                enabled = true,
                layout = {
                    preset = 'ivy',
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
        },
        keys = {
            -- Main Stuff
            { "<leader><space>", function() Snacks.picker.smart() end,                desc = "Smart Find Files" },
            { "<leader>d",       function() Snacks.picker.diagnostics() end,          desc = "Diagnostics" },
            { "<leader>b",       function() Snacks.picker.buffers() end,              desc = "Buffers" },
            { "<leader>/",       function() Snacks.picker.grep() end,                 desc = "Grep" },
            { "<leader>sd",      function() Snacks.picker.diagnostics() end,          desc = "Diagnostics" },
            { "<leader>sk",      function() Snacks.picker.keymaps() end,              desc = "Keymaps" },
            { "<leader>su",      function() Snacks.picker.undo() end,                 desc = "Undo History" },
            { "<leader>se",      function() Snacks.picker.explorer() end,             desc = "Explorer" },
            -- LSP
            { "gd",              function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition" },
            { "gD",              function() Snacks.picker.lsp_declarations() end,     desc = "Goto Declaration" },
            { "gr",              function() Snacks.picker.lsp_references() end,       desc = "References",            nowait = true, },
            { "gi",              function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
            { "gt",              function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
            { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,          desc = "LSP Symbols" },
            -- Find
            { "<leader>sf",      function() Snacks.picker.smart() end,                desc = "Smart Find Files" },
            { "<leader>sb",      function() Snacks.picker.buffers() end,              desc = "Buffers" },
            { "<leader>sf",      function() Snacks.picker.files() end,                desc = "Find Files" },
            { "<leader>sg",      function() Snacks.picker.git_files() end,            desc = "Find Git Files" },
            { "<leader>sr",      function() Snacks.picker.recent() end,               desc = "Recent" },
            { "<leader>sl",      function() Snacks.picker.grep() end,                 desc = "Grep" },
            -- Git
            { "<leader>gs",      function() Snacks.picker.git_files() end,            desc = "Find Git Files" },
            { "<leader>gb",      function() Snacks.picker.git_branches() end,         desc = "Git Branches" },
            { "<leader>gl",      function() Snacks.picker.git_log() end,              desc = "Git Log" },
            { "<leader>gf",      function() Snacks.picker.git_log_file() end,         desc = "Git Log File" },
            { "<leader>gg",      function() Snacks.lazygit() end,                     desc = "Lazygit" },
            -- Search
            { '<leader>s/',      function() Snacks.picker.search_history() end,       desc = "Search History" },
            { "<leader>sc",      function() Snacks.picker.command_history() end,      desc = "Command History" },
            { "<leader>uC",      function() Snacks.picker.colorschemes() end,         desc = "Colorschemes" },
        },
    }
}
