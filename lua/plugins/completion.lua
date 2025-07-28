local function has_words_before()
	local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local icon_provider, hl_provider

local function get_kind_icon(CTX)
	if not icon_provider then
		if not icon_provider then
			local lspkind_avail, lspkind = pcall(require, "lspkind")
			if lspkind_avail then
				icon_provider = function(ctx)
					if ctx.item.source_name == "LSP" then
						local icon = lspkind.symbolic(ctx.kind, { mode = "symbol" })
						if icon then
							ctx.kind_icon = icon
						end
					elseif ctx.item.source_name == "Snippets" then
						local icon = lspkind.symbolic("snippet", { mode = "symbol" })
						if icon then
							ctx.kind_icon = icon
						end
					end
				end
			end
		end
		if not icon_provider then
			icon_provider = function() end
		end
	end
	if not hl_provider then
		local highlight_colors_avail, highlight_colors = pcall(require, "nvim-highlight-colors")
		if highlight_colors_avail then
			local kinds
			hl_provider = function(ctx)
				if not kinds then
					kinds = require("blink.cmp.types").CompletionItemKind
				end
				if ctx.item.kind == kinds.Color then
					local doc = vim.tbl_get(ctx, "item", "documentation")
					if doc then
						local color_item = highlight_colors_avail
							and highlight_colors.format(doc, { kind = kinds[kinds.Color] })
						if color_item and color_item.abbr_hl_group then
							if color_item.abbr then
								ctx.kind_icon = color_item.abbr
							end
							ctx.kind_hl = color_item.abbr_hl_group
						end
					end
				end
			end
		end
		if not hl_provider then
			hl_provider = function() end
		end
	end
	icon_provider(CTX)
	hl_provider(CTX)
	return { text = CTX.kind_icon .. CTX.icon_gap, highlight = CTX.kind_hl }
end

return {
    {
        "Saghen/blink.cmp",
        event = "VeryLazy",
        dependencies = {
            "giuxtaposition/blink-cmp-copilot",
        },
        opts = {
            sources = {
                default = { "lsp", "path", "snippets", "buffer", 'copilot' },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        score_offset = 100,
                        async = true,
                    },
                },
            },
            keymap = {
                ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<C-N>"] = { "select_next", "show" },
                ["<C-P>"] = { "select_prev", "show" },
                ["<C-J>"] = { "select_next", "fallback" },
                ["<C-K>"] = { "select_prev", "fallback" },
                ["<C-U>"] = { "scroll_documentation_up", "fallback" },
                ["<C-D>"] = { "scroll_documentation_down", "fallback" },
                ["<C-e>"] = { "hide", "fallback" },
                ["<CR>"] = { "accept", "fallback" },
                ["<Tab>"] = {
                    "snippet_forward",
                    "select_next",
                    function(cmp)
                        if has_words_before() or vim.api.nvim_get_mode().mode == "c" then
                            return
                                cmp.show()
                        end
                    end,
                    "fallback",
                },
                ["<S-Tab>"] = {
                    "snippet_backward",
                    "select_prev",
                    function(cmp)
                        if vim.api.nvim_get_mode().mode == "c" then return cmp.show() end
                    end,
                    "fallback",
                },
            },
            fuzzy = {
                implementation = 'lua'
            },
            completion = {
                list = { selection = { preselect = false, auto_insert = true } },
                menu = {
                    auto_show = function(ctx) return ctx.mode ~= "cmdline" end,
                    border = "rounded",
                    winhighlight =
                    "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                    draw = {
                        treesitter = { "lsp" },
                        components = {
                            kind_icon = {
                                text = function(ctx) return get_kind_icon(ctx).text end,
                                highlight = function(ctx)
                                    return get_kind_icon(ctx)
                                        .highlight
                                end,
                            },
                        },
                    },
                },
                accept = {
                    auto_brackets = { enabled = true },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                    window = {
                        border = "rounded",
                        winhighlight =
                        "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                    },
                },
            },
            signature = {
                window = {
                    border = "rounded",
                    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
                },
            },
        }
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_format = "fallback" })
                end,
                desc = "[F]ormat buffer",
            },
            {
                "<leader>rf",
                function()
                    local mode = vim.fn.mode()
                    local start_pos, end_pos

					-- Support for visual selection
					if mode == "v" or mode == "V" or mode == "" then
						-- Get visual selection range
						vim.cmd("normal! \\<Esc>")
						start_pos = vim.fn.getpos("'<")
						end_pos = vim.fn.getpos("'>")

						local start_line = start_pos[2] - 1
						local end_line = end_pos[2] - 1
						local end_col = #vim.fn.getline(end_line + 1)

						require("conform").format({
							async = true,
							lsp_format = "fallback",
							range = {
								start = { start_line, 0 },
								["end"] = { end_line, end_col },
							},
						})
					else
						require("conform").format({
							async = true,
							lsp_format = "fallback",
						})
					end
				end,
				mode = { "n", "v" },
				desc = "[F]ormat selected range",
			},
		},
		opts = {
			formatters_by_ft = { -- more under: https://github.com/stevearc/conform.nvim
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},
}
