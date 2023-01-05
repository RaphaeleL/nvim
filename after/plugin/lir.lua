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
    devicons_enable = true,

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
