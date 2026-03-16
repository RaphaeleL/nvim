vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" }, { confirm = false })
vim.pack.add({ "https://github.com/lewis6991/impatient.nvim" }, { confirm = false })
vim.pack.add({ "https://github.com/jake-stewart/multicursor.nvim" }, { confirm = false })
vim.pack.add({ "https://github.com/terrortylor/nvim-comment" }, { confirm = false })
if vim.g.config and vim.g.config.fancy then
    vim.pack.add({ "https://github.com/NStefan002/visual-surround.nvim" }, { confirm = false })
    vim.pack.add({ "https://github.com/MagicDuck/grug-far.nvim" }, { confirm = false })
    vim.pack.add({ "https://github.com/stevearc/conform.nvim" }, { confirm = false })
end

local mc = require("multicursor-nvim")
mc.setup()
vim.api.nvim_set_hl(0, "MultiCursorCursor", { reverse = true })
vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
vim.api.nvim_set_hl(0, "MultiCursorSign", { link = "SignColumn" })
vim.api.nvim_set_hl(0, "MultiCursorMatchPreview", { link = "Search" })
vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { reverse = true })
vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
vim.api.nvim_set_hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
for _, mode in ipairs({ "n", "x" }) do
    vim.keymap.set(mode, "mj", function() mc.lineAddCursor(1) end)
    vim.keymap.set(mode, "mk", function() mc.lineAddCursor(-1) end)
    vim.keymap.set(mode, "mm", function() mc.matchAddCursor(1) end)
    vim.keymap.set(mode, "mc", function() mc.clearCursors() end)
end

require("nvim_comment").setup()
for _, mode in ipairs({ "n", "x" }) do
    vim.keymap.set(mode, "<Leader>l", ":CommentToggle<CR>")
end

if vim.g.config and vim.g.config.fancy then
    require("grug-far").setup({})
    vim.keymap.set("n", "<Leader>gr", ":GrugFar<CR>")

    require("conform").setup({})
    vim.keymap.set("n", "<leader>f", function()
        require("conform").format({ async = true, lsp_format = "fallback" })
        print("Formatted buffer")
    end)
    vim.keymap.set({"n", "v"}, "<leader>rf", function()
        local mode = vim.fn.mode()
        local start_pos, end_pos

        -- Support for visual selection
        if mode == "v" or mode == "V" or mode == "" then
            -- Get visual selection range
            vim.cmd("normal! \\<Esc>")
            start_pos = vim.fn.getpos("'<")
            end_pos = vim.fn.getpos("'>")

            local start_line = start_pos[2] - 1
            local end_line = end_pos[2] - 1
            local end_col = #vim.fn.getline(end_line + 1)

            require("conform").format({
                async = true,
                lsp_format = "fallback",
                range = {
                    start = { start_line, 0 },
                    ["end"] = { end_line, end_col },
                },
            })
            print("Formatted Selection")
        else
            require("conform").format({
                async = true,
                lsp_format = "fallback",
            })
            print("Formatted buffer")
        end
    end)
end
