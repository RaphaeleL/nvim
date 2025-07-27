require("oil").setup({
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    experimental_watch_for_changes = false,
    use_default_keymaps = true,
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

local harpoon = require("harpoon")
harpoon:setup()

-- vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "[H]arpoon [A]dd" })
-- vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "[H]arpoon [M]enu" })
-- vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "[H]arpoon [1] Window" })
-- vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "[H]arpoon [2] Window" })    
-- vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "[H]arpoon [3] Window" })
-- vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "[H]arpoon [4] Window" })
-- vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "[H]arpoon [5] Window" })
-- vim.keymap.set("n", "F", function() harpoon:list():next() end, { desc = "Harpoon [F]orward" })
-- vim.keymap.set("n", "B", function() harpoon:list():prev() end, { desc = "Harpoon [B]ackward" })
