local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    print("Couldn't require nvim-treesitter.configs")
    return
end


treesitter.setup({
    ensured_installed = {
        "bash",
        "comment",
        "scss",
        "css",
        "html",
        "javascript",
        "typescript",
        "lua",
        "markdown",
        "regex",
        "toml",
        "yaml",
        "c",
        "cpp",
        "haskell",
        "java",
        "python",
        "rust",
        "go",
        "php",
        "swift",
        "kotlin",
        "latex",
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
    -- textobjects = {
    --     select = {
    --         enable = true,
    --         lookahead = true,
    --         keymaps = {
    --             ["af"] = "@function.outer",
    --             ["if"] = "@function.inner",
    --             ["ac"] = "@class.outer",
    --             ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
    --         },
    --         selection_modes = {
    --             ['@parameter.outer'] = 'v',
    --             ['@function.outer'] = 'V',
    --             ['@class.outer'] = '<c-v>',
    --         },
    --         include_surrounding_whitespace = true,
    --     },
    -- },
})
