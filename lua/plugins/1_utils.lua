vim.cmd("packadd nvim.undotree")

vim.keymap.set("n", "<leader>u", require("undotree").open)

require("nvim_comment").setup()
for _, mode in ipairs({ "n", "x" }) do
    vim.keymap.set(mode, "<Leader>l", ":CommentToggle<CR>")
end

require("grug-far").setup({})
-- vim.keymap.set("n", "<Leader>gr", ":GrugFar<CR>")
vim.keymap.set("n", "<Leader>gr", function() require("grug-far").open() end)

require("mini.align").setup({
    mappings = {
        start = "<leader>a",
        start_with_preview = "<leader>A",
    },
})

-- require("conform").setup({})
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

vim.keymap.set("n", "<Leader>g", "<cmd>LazyGit<CR>")

-- =======================================================
-- ======= START OF NVIM MULTIPLE CURSOR =================
-- =======================================================

-- Multicursor: built into nvim 0.13, see :h multicursor
-- Emacs multiple-cursors style mappings on top of the builtin Q / {Visual}Q.
vim.api.nvim_set_hl(0, "MCursor", { reverse = true })
vim.api.nvim_set_hl(0, "MCursorVisual", { link = "Visual" })

local function mc_clear()
    local ns = vim.api.nvim_get_namespaces()["nvim.multicursor"]
    if ns then
        vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
    end
end

-- Feed as typed keys ("t"): a Visual selection entered from mapping-fed keys
-- is not replayable at the other cursors (:h dev-cmdatom).
local function feed(keys)
    vim.api.nvim_feedkeys(vim.keycode(keys), "t", false)
end

-- Put the current selection (Visual) or the word under the cursor (Normal)
-- into the search register as a literal pattern. Returns false if empty.
local function search_target()
    local mode = vim.fn.mode()
    local text, word
    if mode == "v" or mode == "V" or mode == "\22" then
        text = table.concat(
            vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = mode }),
            "\n"
        )
    else
        text = vim.fn.expand("<cword>")
        word = true
    end
    if text == "" then return false end
    local pat = "\\V" .. vim.fn.escape(text, "\\/"):gsub("\n", "\\n")
    if word then pat = "\\V\\<" .. vim.fn.escape(text, "\\/") .. "\\>" end
    vim.fn.setreg("/", pat)
    vim.v.searchforward = 1
    return true
end

-- In Normal mode, start by selecting the word (Emacs: first C-> marks it).
local function in_visual()
    local m = vim.fn.mode()
    return m == "v" or m == "V" or m == "\22"
end

local function mark(dir) -- dir: "n" (next) or "N" (previous)
    return function()
        if not search_target() then return end
        if in_visual() then
            feed("<Esc>Q" .. dir .. "gn")      -- cursor here, select next/prev match
        else
            feed("viw<Esc>Q" .. dir .. "gn")
        end
    end
end

local function skip(dir)
    return function()
        if not search_target() then return end
        feed("<Esc>" .. dir .. "gn")           -- no cursor, just move the selection
    end
end

local function mark_all()
    if not search_target() then return end
    if in_visual() then
        feed("Q")                              -- builtin: cursor at every match
    else
        feed("viwQ")
    end
end

-- Emacs mc/edit-lines: one cursor per line of the selection, same column.
local function edit_lines()
    local s, e = vim.fn.line("v"), vim.fn.line(".")
    if s > e then s, e = e, s end
    local col = vim.fn.col("v") < vim.fn.col(".") and vim.fn.col("v") or vim.fn.col(".")
    local keys = "<Esc>" .. s .. "G" .. col .. "|"
    keys = keys .. string.rep("Qj", e - s)
    feed(keys)
end

local map = vim.keymap.set
map({ "n", "x" }, "mn", mark("n")) -- mark next like this
map({ "n", "x" }, "mp", mark("N")) -- mark previous like this
map({ "n", "x" }, "ms", skip("n")) -- skip to next like this
map({ "n", "x" }, "mS", skip("N")) -- skip to previous like this
map({ "n", "x" }, "ma", mark_all) -- mark all like this
map("x", "ml", edit_lines) -- cursor on each line
-- map("n", "mj", "Qj") -- add cursor, move down
-- map("n", "mk", "Qk") -- add cursor, move up
map({ "n", "x" }, "mc", mc_clear) --  clear all cursors

-- =======================================================
-- ======= END OF NVIM MULTIPLE CURSOR ===================
-- =======================================================
