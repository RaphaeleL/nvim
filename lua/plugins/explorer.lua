return {
    -- {
    --     "nvim-telescope/telescope.nvim",
    --     cmd = "Telescope",
    --     dependencies = {
    --         { "isak102/telescope-git-file-history.nvim", lazy = true },
    --     },
    --     lazy = true,
    --     keys = {
    --         { "<leader>sf",      ":Telescope find_files theme=ivy<cr>",                                          desc = " Telescope: [S]how [F]uzzy File Finder", },
    --         { "<leader>sl",      ":Telescope live_grep theme=ivy<cr>",                                           desc = " Telescope: [S]how [L]ive Grep", },
    --         { "<leader>sd",      ":Telescope diagnostics theme=ivy<cr>",                                         desc = " Telescope: [S]how [D]iagnostics", },
    --         { "<leader>sb",      ":Telescope buffers theme=ivy<cr>",                                             desc = " Telescope: [S]how Buffers", },
    --         { "<leader>sk",      ":Telescope keymaps theme=ivy<cr>",                                             desc = " Telescope: [S]how [K]eymaps", },
    --         { "<leader>sg",      ":Telescope git_files theme=ivy<cr>",                                           desc = " Telescope: [S]how [G]it Files", },
    --         { "<leader>sc",      ":Telescope git_commits theme=ivy<cr>",                                         desc = " Telescope: [S]how Git [C]ommits", },
    --         { "<leader>sh",      ":lua require('telescope').extensions.git_file_history.git_file_history()<cr>", desc = " Telescope: [S]how Git [H]istory of File", },
    --
    --         { "<leader><space>", ":Telescope find_files theme=ivy<cr>",                                          desc = " Telescope: [S]how [F]uzzy File Finder", },
    --         { "<leader>/",       ":Telescope live_grep theme=ivy<cr>",                                           desc = " Telescope: [S]how [L]ive Grep", },
    --         { "<leader>,",       ":Telescope buffers theme=ivy<cr>",                                             desc = " Telescope: [S]how Buffers", },
    --         { "<leader>.",       ":Telescope diagnostics theme=ivy<cr>",                                         desc = " Telescope: [S]how [D]iagnostics", },
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
    --             }
    --         },
    --         pickers = {
    --             colorscheme = {
    --                 enable_preview = true,
    --             },
    --         },
    --     },
    -- },
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

    },
    {
        "stevearc/oil.nvim",
        opts = {
            default_file_explorer = true,
            skip_confirm_for_simple_edits = true,
            experimental_watch_for_changes = false,
            use_default_keymaps = true,
            columns = {
                -- "icon",
                "permissions",
                "size",
                "mtime",
            },
            view_options = {
                show_hidden = true,
                natural_order = true,
            },
            float = {
                max_width = (math.floor(vim.opt.columns:get() * 0.6)),
                max_height = (math.floor(vim.opt.lines:get() * 0.6)),
            },
        },
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
}
