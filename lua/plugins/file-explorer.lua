return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = true,
        dependencies = {
            "MunifTanjim/nui.nvim"
        },
        keys = {
            { "<leader>e", ":Neotree toggle<cr>", "(NaaVim) Open Left File Explorer" }
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    mappings = {
                        ["<space>"] = { 
                            "toggle_node", 
                            nowait = false,
                        },
                        ["<2-LeftMouse>"] = "open",
                        ["<tab>"] = "open",
                        ["<esc>"] = "revert_preview",
                        ["P"] = { "toggle_preview", config = { use_float = true } },
                        ["l"] = "focus_preview",
                        ["v"] = "open_split",
                        ["h"] = "open_vsplit",
                        ["t"] = "open_tabnew",
                        ["C"] = "close_node",
                        ["z"] = "close_all_nodes",
                        ["a"] = { 
                            "add",
                            config = {
                                show_path = "none"
                            }
                        },
                        ["A"] = "add_directory", 
                        ["d"] = "delete",
                        ["r"] = "rename",
                        ["y"] = "copy_to_clipboard",
                        ["x"] = "cut_to_clipboard",
                        ["p"] = "paste_from_clipboard",
                        ["c"] = "copy", 
                        ["m"] = "move",
                        ["q"] = "close_window",
                        ["R"] = "refresh",
                        ["?"] = "show_help",
                        ["<"] = "prev_source",
                        [">"] = "next_source",
                    }
                }
            })
        end,
    },
    {    
        "nvim-telescope/telescope.nvim",
        lazy = true,
        keys = {
            { "<leader>sf", ":Telescope find_files theme=dropdown<cr>",           desc = "(NaaVim) Telescope: [S]how [F]uzzy File Finder" },
            { "<leader>sl", ":Telescope live_grep theme=dropdown<cr>",            desc = "(NaaVim) Telescope: [S]how [L]ive Grep" },
            { "<leader>sg", ":Telescope git_files theme=dropdown<cr>",            desc = "(NaaVim) Telescope: [S]how [G]it Files" },
            { "<leader>sb", ":Telescope buffers theme=dropdown<cr>",              desc = "(NaaVim) Telescope: [S]how Buffers" },
            { "<leader>sd", ":Telescope diagnostics theme=dropdown<cr>",          desc = "(NaaVim) Telescope: [S]how [D]iagnostics" },
            { "<leader>ss", ":Telescope grep_string theme=dropdown<cr>",          desc = "(NaaVim) Telescope: [S]how [G]rep" },
            { "<leader>so", ":Telescope lsp_document_symbols theme=dropdown<cr>", desc = "(NaaVim) Telescope: [S]how [O]utliner" },
            { "<leader>sk", ":Telescope keymaps theme=dropdown<cr>",              desc = "(NaaVim) Telescope: [S]how [K]eymaps" },
            { "<leader>?", ":Telescope oldfiles theme=dropdown<cr>",              desc = "(NaaVim) Telescope: Show Oldfiles" },
            { "<leader>/",
                ":lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<cr>",
                desc = "(NaaVim) Telescope: Search in the Current File" },
        },
        config = function()
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                        ".DS_Store"
                    }
                },
            })
        end,
    },
}
