return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        config = function()
            require 'nvim-treesitter.configs'.setup {
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
    --
    --                 -- Mode
    --                 table.insert(segments, extensions.mode)
    --
    --                 -- Git Branch
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
    --
    --                 -- Git Changes 
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
    --                 -- File
    --                 table.insert(segments, builtin.file)
    --
    --                 return segments
    --             end
    --         })
    --     end
    -- }
}
