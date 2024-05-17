return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        config = function()
            require "nvim-treesitter.configs".setup {
                ensure_installed = { "c", "cpp", "rust", "lua", "vim", "vimdoc", "query", "bash", "cmake", "make", "python", "dockerfile", "scss", "typescript", "javascript", "css", "html", "yaml", "go" },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
            }
        end
    },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        opts = {
            delay = 10,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" },
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
    },
    {
        "tjdevries/express_line.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            vim.opt.laststatus = 2
            vim.opt.cmdheight = 1
            vim.opt.showcmd = true
            require("el").setup({})
        end
    },
    {
        "mcauley-penney/visual-whitespace.nvim",
        event = "InsertEnter",
        config = true,
        opts = {
            highlight = { link = 'Visual' },
            space_char = '·',
            tab_char = '→',
            nl_char = '↲',
            cr_char = '←'
        },
    }
}
