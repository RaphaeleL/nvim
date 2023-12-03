local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
	-- {
	-- 	"lifepillar/vim-gruvbox8",
	-- 	config = function()
	-- 		vim.cmd("colorscheme gruvbox8_hard")
	-- 	end
	-- },
    {
        "terrortylor/nvim-comment",
        event = "VeryLazy",
        config = function()
            require("nvim_comment").setup()
        end,
        keys = {
            { "<Leader>l", ":CommentToggle<cr>" }
        }
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true
    },
    {
        "lewis6991/impatient.nvim",
        enabled = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        keys = {
            { "<leader>sf", ":Telescope find_files theme=ivy<cr>" },
            { "<leader>sl", ":Telescope live_grep theme=ivy<cr>" },
            { "<leader>sg", ":Telescope git_files theme=ivy<cr>" },
            { "<leader>sb", ":Telescope buffers theme=ivy<cr>" },
            { "<leader>sd", ":Telescope diagnostics theme=ivy<cr>" },
            { "<leader>ss", ":Telescope grep_string theme=ivy<cr>" },
            { "<leader>so", ":Telescope lsp_document_symbols theme=ivy<cr>" },
            { "<leader>sk", ":Telescope keymaps theme=ivy<cr>" },
            { "<leader>sm", ":Telescope harpoon marks theme=ivy<cr>" },
            { "<leader>sc", ":Telescope colorscheme theme=ivy<cr>" },
            { "<leader>?", ":Telescope oldfiles theme=ivy<cr>" },
            { "<leader>/", ":lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy { winblend = 10, previewer = false, })<cr>" },
        },
        config = function()
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                        ".DS_Store"
                    }
                },
            })
        end,
    },
}, {})
