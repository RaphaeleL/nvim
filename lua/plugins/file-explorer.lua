return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim"
        },
        keys = {
            { "<leader>f", ":Neotree<cr>", "(NaaVim) Open Left File Explorer" }
        },
        config = function()
            require("neo-tree").setup({
                default_component_configs = {
                    window = {
                        mappings = {
                            -- ====================================
                            -- LIR Keymaps
                            -- ====================================
                            ["<CR>"] = "open",
                            ["H"] = "open_split",
                            ["V"] = "open_vsplit",

                            -- ["t"] = actions.tabedit,
                            ["-"] = "close_node",
                            ["m"] = "add_directory",
                            -- ["n"] = actions.newfile,
                            ["r"] = "rename",
                            -- ["y"] = actions.yank_path,
                            ["d"] = "delete",
                            -- ["."] = actions.toggle_show_hidden,
                            -- ["J"] = function()
                            --     mark_actions.toggle_mark()
                            --     vim.cmd("normal! j")
                            -- end,
                            ["y"] = "copy_to_clipboard",
                            ["c"] = "copy",
                            ["x"] = "cut_to_clipboard",
                            ["p"] = "paste_from_clipboard",
                            -- ====================================
                            -- NEOTREE Keymaps
                            -- ====================================
                            ["R"] = "refresh",
                            ["P"] = "toggle_preview",
                            ["f"] = "toggle_preview",
                            -- ====================================
                        }
                    }
                }
            })
        end,
    },
    {
        "tamago324/lir.nvim",
        lazy = true,
        keys = {
            { "e", ":lua require('lir.float').toggle()<cr>" },
        },
        dependencies = {
            "tamago324/lir-git-status.nvim"
        },
        config = function()
            local has_lir, lir = pcall(require, "lir")
            if not has_lir then
                require("notify")("Couldn't require lir", "error")
                return
            end

            local has_devicons, devicons = pcall(require, "nvim-web-devicons")
            if has_devicons then
                devicons.setup {
                    override = {
                        lir_folder_icon = {
                            icon = "",
                            color = "#7ebae4",
                            name = "LirFolderNode",
                        },
                    },
                }
            end

            local actions = require "lir.actions"
            local mark_actions = require "lir.mark.actions"
            local clipboard_actions = require "lir.clipboard.actions"

            lir.setup {
                show_hidden_files = true,
                devicons = {
                    enable = true,
                    highlight_dirname = true,
                },

                float = { winblend = 15 },

                mappings = {
                    ["<CR>"] = actions.edit,
                    ["H"] = actions.split,
                    ["V"] = actions.vsplit,
                    ["t"] = actions.tabedit,
                    ["-"] = actions.up,

                    ["m"] = actions.mkdir,
                    ["n"] = actions.newfile,
                    ["r"] = actions.rename,
                    ["y"] = actions.yank_path,
                    ["d"] = actions.delete,
                    ["."] = actions.toggle_show_hidden,

                    ["J"] = function()
                        mark_actions.toggle_mark()
                        vim.cmd("normal! j")
                    end,

                    ["c"] = clipboard_actions.copy,
                    ["x"] = clipboard_actions.cut,
                    ["p"] = clipboard_actions.paste,
                },
            }

            require("lir.git_status").setup {
                show_ignored = false,
            }
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        keys = {
            { "<leader>sf", ":Telescope find_files<cr>",           desc = "(NaaVim) Telescope: [S]how [F]uzzy File Finder" },
            { "<leader>sl", ":Telescope live_grep<cr>",            desc = "(NaaVim) Telescope: [S]how [L]ive Grep" },
            { "<leader>sg", ":Telescope git_files<cr>",            desc = "(NaaVim) Telescope: [S]how [G]it Files" },
            { "<leader>sb", ":Telescope buffers<cr>",              desc = "(NaaVim) Telescope: [S]how Buffers" },
            { "<leader>sd", ":Telescope diagnostics<cr>",          desc = "(NaaVim) Telescope: [S]how [D]iagnostics" },
            { "<leader>ss", ":Telescope grep_string<cr>",          desc = "(NaaVim) Telescope: [S]how [G]rep" },
            { "<leader>so", ":Telescope lsp_document_symbols<cr>", desc = "(NaaVim) Telescope: [S]how [O]utliner" },
            { "<leader>sk", ":Telescope keymaps<cr>",              desc = "(NaaVim) Telescope: [S]how [K]eymaps" },
            { "<leader>/",
                ":lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<cr>",
                desc = "(NaaVim) Telescope: Search in the Current File" },
            { "<leader>?", ":Telescope oldfiles<cr>", desc = "(NaaVim) Telescope: Show Oldfiles" },
        }
    },
}
