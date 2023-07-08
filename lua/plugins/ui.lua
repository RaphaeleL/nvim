return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        -- dependencies = {
        --     "nvim-treesitter/playground",
        -- },
        config = function()
            local ok, treesitter = pcall(require, "nvim-treesitter.configs")

            if not ok then
                require("notify")("Couldn't require nvim-treesitter.configs", "error")
                return
            end
            treesitter.setup({
                ensured_installed = {
                    "html", "markdown", "markdown-inline", "bash",
                    "comment", "scss", "css", "html", "javascript",
                    "typescript", "lua", "vimdoc", "regex", "toml",
                    "yaml", "c", "cpp", "haskell", "java", "python",
                    "rust", "go", "php", "swift", "kotlin", "latex",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                },
                rainbow = {
                    enable = true,
                    colors = {
                        "#68a0b0",
                        "#946EaD",
                        "#c7aA6D",
                    },
                },
                -- playground = {
                --     enable = true,
                --     disable = {},
                --     updatetime = 25,
                --     persist_queries = false,
                --     keybindings = {
                --         toggle_query_editor = 'o',
                --         toggle_hl_groups = 'i',
                --         toggle_injected_languages = 't',
                --         toggle_anonymous_nodes = 'a',
                --         toggle_language_display = 'I',
                --         focus_language = 'f',
                --         unfocus_language = 'F',
                --         update = 'R',
                --         goto_node = '<cr>',
                --         show_help = '?',
                --     },
                -- }
            })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
    },
}
