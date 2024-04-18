return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "cpp", "rust", "lua", "vim", "vimdoc", "query", "bash", "cmake", "make", "python", "dockerfile", "scss", "typescript", "javascript", "css", "html", "yaml", "go"},
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
            }
        end
    },
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     main = "ibl",
    --     event = "VeryLazy",
    -- },
}
