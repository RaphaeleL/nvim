local config = require("config")

vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" }, { confirm = false })
vim.pack.add({ "https://github.com/terrortylor/nvim-comment" }, { confirm = false })
if config.extras then
    vim.pack.add({ "https://github.com/NStefan002/visual-surround.nvim" }, { confirm = false })
    vim.pack.add({ "https://github.com/MagicDuck/grug-far.nvim" }, { confirm = false })
end
if config.format then
    vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim", version = vim.version.range("*") } }, { confirm = false })
end
vim.cmd("packadd nvim.undotree")

vim.keymap.set("n", "<leader>u", require("undotree").open)

-- Multicursor: built into nvim 0.13, see :h multicursor
-- Builtin extras: Q toggles a cursor, [count]Q places one at every search
-- match, {Visual}Q at every match of the selection, q= toggles follow mode,
-- gQ restores cleared cursors, ]C / [C jump between cursors.
vim.api.nvim_set_hl(0, "MCursor", { reverse = true })
vim.api.nvim_set_hl(0, "MCursorVisual", { link = "Visual" })

local function mc_clear()
    local ns = vim.api.nvim_get_namespaces()["nvim.multicursor"]
    if ns then
        vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
    end
end

vim.keymap.set("n", "mj", "Qj", { desc = "LR - Multicursor: Add Cursor and move down" })
vim.keymap.set("n", "mk", "Qk", { desc = "LR - Multicursor: Add Cursor and move up" })
vim.keymap.set("n", "mm", "Q*", { desc = "LR - Multicursor: Add Cursor and go to next Match of Word" })
-- One-by-one match cursors like the old plugin's matchAddCursor:
-- add a cursor on the current match of the selected text, then jump to and
-- select the next match. Press mm repeatedly to collect matches one by one.
vim.keymap.set("x", "mm", function()
    local text = table.concat(
        vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.fn.mode() }),
        "\n"
    )
    if text == "" then return end
    vim.fn.setreg("/", "\\V" .. (vim.fn.escape(text, "\\/"):gsub("\n", "\\n")))
    -- <Esc>Q: drop a cursor inside the current match, ngn: select next match.
    -- Feed as typed keys ("t"): a Visual selection entered from mapping-fed
    -- keys is not replayable at the other cursors (:h dev-cmdatom), so the
    -- final change would only apply to the primary cursor.
    vim.api.nvim_feedkeys(vim.keycode("<Esc>Qngn"), "t", false)
end, { desc = "LR - Multicursor: Add Cursor on Match and select next Match" })
vim.keymap.set({ "n", "x" }, "mc", mc_clear, { desc = "LR - Multicursor: Clear all Cursors" })

require("nvim_comment").setup()
for _, mode in ipairs({ "n", "x" }) do
    vim.keymap.set(mode, "<Leader>l", ":CommentToggle<CR>")
end

if config.extras then
    require("grug-far").setup({})
    vim.keymap.set("n", "<Leader>gr", ":GrugFar<CR>")
end

if config.format then
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
