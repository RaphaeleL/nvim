return {
    {
        "stevearc/oil.nvim",
        opts = {
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
        },
    },
    {
        "ThePrimeagen/harpoon",
        lazy = true,
        branch = "harpoon2",
        keys = {
            { "<leader>ha", function() require('harpoon'):list():add() end,                                    desc = "[H]arpoon [A]dd" },
            { "<leader>hm", function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, desc = "[H]arpoon [A]dd" },
            { "<leader>1",  function() require('harpoon'):list():select(1) end,                                desc = "[H]arpoon [1] Window" },
            { "<leader>2",  function() require('harpoon'):list():select(2) end,                                desc = "[H]arpoon [2] Window" },
            { "<leader>3",  function() require('harpoon'):list():select(3) end,                                desc = "[H]arpoon [3] Window" },
            { "<leader>4",  function() require('harpoon'):list():select(4) end,                                desc = "[H]arpoon [4] Window" },
            { "<leader>5",  function() require('harpoon'):list():select(5) end,                                desc = "[H]arpoon [5] Window" },
            { "F",          function() require('harpoon'):list():next() end,                                   desc = "Harpoon [F]orward" },
            { "B",          function() require('harpoon'):list():prev() end,                                   desc = "Harpoon [B]ackward" }
        },
        init = function()
            local harpoon = require("harpoon")
            harpoon:setup()
        end,
    },
}
