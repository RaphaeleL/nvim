return {
    'echasnovski/mini.icons',
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "vimdoc", "javascript", "typescript", "c", "lua",
                    "python", "yaml", "bash", "make"
                },
                sync_install = false,
                auto_install = true,
                indent = {
                    enable = true
                },
                highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        if lang == "html" then
                            print("disabled")
                            return true
                        end
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            vim.notify(
                                "File larger than 100KB treesitter disabled for performance",
                                vim.log.levels.WARN,
                                {title = "Treesitter"}
                            )
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = { "markdown" },
                },
            })
        end
    },
    {
        "mcauley-penney/visual-whitespace.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            highlight = { link = "Visual" },
            space_char = "·",
            tab_char = "→",
            nl_char = "↲",
            cr_char = "←",
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        init = function()
            vim.opt.laststatus = 2
            vim.opt.cmdheight = 1
    
            local mode_map = {
                ["n"] = "N",  -- Normal Mode
                ["i"] = "I",  -- Insert Mode
                ["v"] = "V",  -- Visual Mode
                ["V"] = "VL", -- Visual Line Mode
                [""] = "VB", -- Visual Block Mode
                ["c"] = "C",  -- Command Mode
                ["R"] = "R",  -- Replace Mode
                ["t"] = "T",  -- Terminal Mode
            }
    
            local custom_rosepine = require("lualine.themes.rose-pine-alt")
            custom_rosepine.normal.a.bg = "NONE"
            custom_rosepine.normal.b.bg = "NONE"
            custom_rosepine.normal.c.bg = "NONE"
            custom_rosepine.insert.a.bg = "NONE"
            custom_rosepine.visual.a.bg = "NONE"
            custom_rosepine.command.a.bg = "NONE"
            custom_rosepine.replace.a.bg = "NONE"
            custom_rosepine.inactive.a.bg = "NONE"
            custom_rosepine.inactive.b.bg = "NONE"
            custom_rosepine.inactive.c.bg = "NONE"
    
            require("lualine").setup({
                options = {
                    icons_enabled = false,
                    theme = custom_rosepine,
                    component_separators = "",
                    section_separators = "",
                    ignore_focus = {}
                },
                sections = {
                    lualine_a = {
                        function()
                            local mode = vim.fn.mode()
                            return mode_map[mode] or mode
                        end,
                    },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = {
                        -- "%=",
                        {
                            "filename",
                            path = 1,
                            -- 0: Just the filename
                            -- 1: Relative path
                            -- 2: Absolute path
                            -- 3: Absolute path, with tilde as the home directory
                            -- 4: Filename and parent dir, with tilde as the home directory
                        },
                    },
                    lualine_x = {},
                    lualine_y = { "filetype" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = { "filename" },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { "location" },
                },
                tabline = {},
                extensions = {},
            })
        end,
    },
    -- {
    -- 	"tjdevries/express_line.nvim",
    -- 	event = "VeryLazy",
    -- 	config = function()
    -- 		vim.opt.laststatus = 2
    -- 		vim.opt.cmdheight = 1
    -- 		vim.opt.showcmd = true
    -- 		require("el").setup({})
    -- 		vim.defer_fn(function()
    -- 			-- NOTE: This is not working in certain filetypes, e.g. Python.
    -- 			vim.cmd([[hi StatusLine guibg=None]])
    -- 			vim.cmd([[hi StatusLineNC guibg=None]])
    -- 		end, 100)
    -- 	end,
    -- }
}
