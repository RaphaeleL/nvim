return {
    {
        "tamago324/lir.nvim",
        lazy = true,
        keys = {
            -- { "E", ":edit %:h<cr>" },
            { "e", ":lua require('lir.float').toggle()<cr>" },
        },
        dependencies = {
            "tamago324/lir-git-status.nvim"
        },
        config = function()
            local has_lir, lir = pcall(require, "lir")
            if not has_lir then
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
            { "<leader>sf", ":Telescope find_files<cr>", desc = "Telescope: [S]how [F]uzzy File Finder" },
            { "<leader>sl", ":Telescope live_grep<cr>", desc = "Telescope: [S]how [L]ive Grep" },
            { "<leader>sg", ":Telescope git_files<cr>", desc = "Telescope: [S]how [G]it Files" },
            { "<leader><space>", ":Telescope buffers<cr>", desc = "Telescope: [S]how Buffers" },
            { "<leader>sd", ":Telescope diagnostics<cr>", desc = "Telescope: [S]how [D]iagnostics" },
            { "<leader>ss", ":Telescope grep_string<cr>", desc = "Telescope: [S]how [G]rep" },
            { "<leader>so", ":Telescope lsp_document_symbols<cr>", desc = "Telescope: [S]how [O]utliner" },
            { "<leader>sk", ":Telescope keymaps<cr>", desc = "Telescope: [S]how [K]eymaps" },
            { "<leader>/",
                ":lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<cr>",
                desc = "Telescope: Search in the Current File" },
            { "<leader>?", ":Telescope oldfiles<cr>", desc = "Telescope: [S]how Oldfiles" },
        }
    },
}
