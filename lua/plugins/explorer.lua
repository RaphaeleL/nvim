vim.pack.add({ "https://github.com/stevearc/oil.nvim" }, { confirm = false })
vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim" }, { confirm = false })
-- manually switch the branch to harpoon2
-- cd ~/.local/share/nvim/site/pack/core/opt/harpoon/
-- git switch harpoon2 
vim.pack.add({ "https://github.com/ThePrimeagen/harpoon" }, { confirm = false })

local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "F", function() harpoon:list():next() end)
vim.keymap.set("n", "B", function() harpoon:list():prev() end)

require("telescope").setup({ pickers = { find_files = { theme = "ivy" } } })
local pickers = require("telescope.builtin")
vim.keymap.set("n", "<leader><leader>", pickers.find_files)
vim.keymap.set("n", "<leader>sf", pickers.find_files)
vim.keymap.set("n", "<leader>sb", pickers.buffers)
vim.keymap.set("n", "<leader>/", pickers.live_grep)
vim.keymap.set("n", "<leader>sh", pickers.help_tags)
vim.keymap.set("n", "<leader>sm", pickers.man_pages)

require("oil").setup({
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    experimental_watch_for_changes = false,
    use_default_keymaps = true,
    float = {
        max_width = 0.8,
        max_height = 0.7,
    },
    preview_win = {
        update_on_cursor_moved = true,
        preview_method = "fast_scratch",
        disable_preview = false,
        win_options = {},
    },
    columns = {
        "permissions",
        "size",
        "mtime",
    },
    view_options = {
        show_hidden = true,
        natural_order = true,
    },
})
