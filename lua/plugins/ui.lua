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
    -- {
    --     "nvim-lualine/lualine.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("lualine").setup({
    --             options = {
    --                 icons_enabled = true,
    --                 theme = "codedark", -- "auto"
    --                 component_separators = { left = "", right = "" },
    --                 section_separators = { left = "", right = "" },
    --                 disabled_filetypes = {
    --                     statusline = {},
    --                     winbar = {},
    --                 },
    --                 ignore_focus = {},
    --                 always_divide_middle = true,
    --                 globalstatus = false,
    --                 refresh = {
    --                     statusline = 1000,
    --                     tabline = 1000,
    --                     winbar = 1000,
    --                 }
    --             },
    --             sections = {
    --                 lualine_a = { "mode" },
    --                 lualine_b = { "branch", "diff", "diagnostics" },
    --                 lualine_c = { "filename" },
    --                 lualine_x = {},
    --                 lualine_y = { "progress" },
    --                 lualine_z = { "location" }
    --             },
    --             inactive_sections = {
    --                 lualine_a = {},
    --                 lualine_b = {},
    --                 lualine_c = { "filename" },
    --                 lualine_x = { "location" },
    --                 lualine_y = {},
    --                 lualine_z = {}
    --             },
    --             tabline = {},
    --             winbar = {},
    --             inactive_winbar = {},
    --             extensions = {}
    --         })
    --     end,
    -- }
    -- {
    --     "tjdevries/express_line.nvim",
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons"
    --     },
    --     config = function()
    --         vim.opt.laststatus = 2
    --         vim.opt.cmdheight = 1
    --         vim.opt.showcmd = true
    --         require("el").setup({
    --             generator = function(win_id)
    --                 local segments = {}
    --                 local builtin = require("el.builtin")
    --                 local extensions = require("el.extensions")
    --                 local subscribe = require("el.subscribe")
    --                 table.insert(segments, extensions.mode)
    --                 table.insert(segments, builtin.file)
    --                 table.insert(segments,
    --                     subscribe.buf_autocmd(
    --                         "el_git_branch",
    --                         "BufEnter",
    --                         function(window, buffer)
    --                             local branch = extensions.git_branch(window, buffer)
    --                             if branch then
    --                                 return branch
    --                             end
    --                         end
    --                     ))
    --                 table.insert(segments,
    --                     subscribe.buf_autocmd(
    --                         "el_git_status",
    --                         "BufWritePost",
    --                         function(window, buffer)
    --                             local changes = extensions.git_changes(window, buffer)
    --                             if changes then
    --                                 return changes
    --                             end
    --                         end
    --                     ))
    --
    --                 return segments
    --             end
    --         })
    --     end
    -- }
}
