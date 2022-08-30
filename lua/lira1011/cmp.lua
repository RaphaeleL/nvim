local tabnine_status_ok, tabnine = pcall(require, "cmp_tabnine.config")
if not tabnine_status_ok then
	require("user.notify").message("Coult not load cmp_tabnine.config", "Loading Error", "error")
	return
end
local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
	require("user.notify").message("Coult not load lspkind", "Loading Error", "error")
	return
end
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	require("user.notify").message("Coult not load cmp", "Loading Error", "error")
	return
end
local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	require("user.notify").message("Coult not load luasnip", "Loading Error", "error")
	return
end

tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
	show_prediction_strength = false,
})

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "cmp_tabnine" },
		{ name = "vsnip" },
	}, {
		{ name = "buffer" },
	}),
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			--winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
		},
		completion = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			--winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
		},
	},
	experimental = {
		ghost_text = true,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 40,
			--before = function(entry, vim_item)
			--	vim_item.kind = lspkind.presets.default[vim_item.kind]
			--	local menu = source_mapping[entry.source.name]
			--	if entry.source.name == "cmp_tabnine" then
			--		if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
			--			menu = entry.completion_item.data.detail .. " " .. menu
			--		end
			--		vim_item.kind = ""
			--	end
			--	vim_item.menu = menu
			--	return vim_item
			--end,
		}),
	},
})

cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" },
	}, {
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
