return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "c", "cpp", "rust", "lua", "vim",
                "vimdoc", "query", "bash", "cmake", "make", "python",
                "dockerfile", "scss", "typescript", "javascript", "css",
                "html", "yaml", "go" },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
            }
        end
    },
    {
        "mcauley-penney/visual-whitespace.nvim",
        event = "InsertEnter",
        config = true,
        opts = {
            highlight = { link = 'Visual' },
            space_char = "·",
            tab_char = "→",
            nl_char = "↲",
            cr_char = "←"
        },
    },
    {
        "brenoprata10/nvim-highlight-colors",
        event = "InsertEnter",
        opts = {
            render = 'background',
            virtual_symbol = '■',
            enable_named_colors = true,
            enable_tailwind = false,
            custom_colors = {
                { label = '%-%-theme%-primary%-color', color = '#0f1219' },
                { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
            }
        }
    },
    -- {
    --     "tjdevries/express_line.nvim",
    --     config = function()
    --         vim.opt.laststatus = 2
    --         vim.opt.cmdheight = 1
    --         vim.opt.showcmd = true
    --         require("el").setup({})
    --         -- TODO: This is not working, but it should :D
    --         -- vim.cmd [[autocmd! ColorScheme * highlight StatusLine guibg=None]]
    --         -- vim.cmd [[autocmd! ColorScheme * highlight StatusLineNC guibg=None]]
    --     end
    -- },
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	main = "ibl",
	-- 	event = "VeryLazy",
	-- 	keys = {
	-- 		{ "<Leader>ue", "<cmd>IBLToggle<CR>", desc = "Toggle indent-lines" },
	-- 	},
	-- 	opts = {
	-- 		indent = {
	-- 			char = "│",
	-- 			tab_char = "│",
	-- 		},
	-- 		scope = { enabled = false },
	-- 		exclude = {
	-- 			filetypes = {
	-- 				"alpha",
	-- 				"checkhealth",
	-- 				"dashboard",
	-- 				"git",
	-- 				"gitcommit",
	-- 				"help",
	-- 				"lazy",
	-- 				"lazyterm",
	-- 				"lspinfo",
	-- 				"man",
	-- 				"mason",
	-- 				"neo-tree",
	-- 				"notify",
	-- 				"Outline",
	-- 				"TelescopePrompt",
	-- 				"TelescopeResults",
	-- 				"terminal",
	-- 				"toggleterm",
	-- 				"Trouble",
	-- 			},
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		if vim.fn.has("nvim-0.10.0") == 0 then
	-- 			local utils = require("ibl.utils")
	-- 			---@diagnostic disable-next-line: deprecated
	-- 			utils.tbl_join = vim.tbl_flatten
	-- 		end
	-- 		require("ibl").setup(opts)
	-- 	end,
	-- },
    -- {
    --     "RRethy/vim-illuminate",
    --     event = "InsertEnter",
    --     opts = {
    --         delay = 10,
    --         large_file_cutoff = 2000,
    --         large_file_overrides = {
    --             providers = { "lsp" },
    --         },
    --     },
    --     config = function(_, opts)
    --         require("illuminate").configure(opts)
    --     end,
    -- },
}
