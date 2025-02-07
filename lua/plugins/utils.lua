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
                    "%.png",
                    "%.jpg",
                    "%.jpeg",
                },
            },
            pickers = {
                -- find_files = {
                -- 	theme = "ivy",
                -- },
                -- colorscheme = {
                -- 	enable_preview = true,
                -- },
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

            vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
            vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            vim.keymap.set("n", "F", function() harpoon:list():next() end)
            vim.keymap.set("n", "B", function() harpoon:list():prev() end)
            vim.keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end)

            harpoon:setup({})
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
            { "<leader>sr", ":GrugFar<cr>", desc = "Search and Replace in files" },
        },
    },
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        config = function()
            local mc = require("multicursor-nvim")

            mc.setup()

            local set = vim.keymap.set

            -- TODO: `<leader>n` is already used by `:noh`
            -- TODO: Arrow Keys are not working on some keyboards, replace with `hjkl`

            -- Add or skip cursor above/below the main cursor.
            set({ "n", "v" }, "<up>", function() mc.lineAddCursor(-1) end)
            set({ "n", "v" }, "<down>", function() mc.lineAddCursor(1) end)
            set({ "n", "v" }, "<leader><up>", function() mc.lineSkipCursor(-1) end)
            set({ "n", "v" }, "<leader><down>", function() mc.lineSkipCursor(1) end)

            -- Add or skip adding a new cursor by matching word/selection
            set({ "n", "v" }, "<leader>n", function() mc.matchAddCursor(1) end)
            set({ "n", "v" }, "<leader>s", function() mc.matchSkipCursor(1) end)
            set({ "n", "v" }, "<leader>N", function() mc.matchAddCursor(-1) end)
            set({ "n", "v" }, "<leader>S", function() mc.matchSkipCursor(-1) end)

            -- Add all matches in the document
            set({ "n", "v" }, "<leader>A", mc.matchAllAddCursors)

            -- Rotate the main cursor.
            set({ "n", "v" }, "<left>", mc.nextCursor)
            set({ "n", "v" }, "<right>", mc.prevCursor)

            -- Delete the main cursor.
            set({ "n", "v" }, "<leader>x", mc.deleteCursor)

            -- Add and remove cursors with control + left click.
            set("n", "<c-leftmouse>", mc.handleMouse)

            -- Disable Cursors (+ default ESC behavior)
            set("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                elseif mc.hasCursors() then
                    mc.clearCursors()
                else
                    -- Default <esc> handler.
                end
            end)

            -- Customize the Cursors look
            local hl = vim.api.nvim_set_hl
            hl(0, "MultiCursorCursor", { link = "Cursor" })
            hl(0, "MultiCursorVisual", { link = "Visual" })
            hl(0, "MultiCursorSign", { link = "SignColumn" })
            hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
            hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
            hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
        end
    }
}
