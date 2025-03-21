return {
	"neovim/nvim-lspconfig",
	-- event = { "BufReadPre", "BufNewFile" },
	event = 'InsertEnter',
	dependencies = {
		"folke/neodev.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "stevearc/conform.nvim", event = { "BufReadPre", "BufNewFile" } },
		{ "b0o/SchemaStore.nvim", event = { "BufReadPre", "BufNewFile" } },
		{ "j-hui/fidget.nvim", event = { "BufReadPre", "BufNewFile" } },
		{ "rachartier/tiny-inline-diagnostic.nvim", event = { "BufReadPre", "BufNewFile" } },
	},
	config = function()
		require("neodev").setup({})
		require("fidget").setup({
			notification = {
				window = {
					winblend = 0,
				},
			},
		})

		vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
		vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

		local border = {
			{ "🭽", "FloatBorder" },
			{ "▔", "FloatBorder" },
			{ "🭾", "FloatBorder" },
			{ "▕", "FloatBorder" },
			{ "🭿", "FloatBorder" },
			{ "▁", "FloatBorder" },
			{ "🭼", "FloatBorder" },
			{ "▏", "FloatBorder" },
		}

		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
		}

		local capabilities = nil
		if pcall(require, "cmp_nvim_lsp") then
			capabilities = require("cmp_nvim_lsp").default_capabilities()
		end

		local lspconfig = require("lspconfig")

		local servers = {
			bashls = true,
			lua_ls = {
				server_capabilities = {
					semanticTokensProvider = vim.NIL,
				},
			},
			rust_analyzer = true,
			clangd = {
				init_options = { clangdFileStatus = true },
				filetypes = { "c" },
			},
			pyright = {
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "workspace",
							useLibraryCodeForTypes = true,
						},
					},
				},
			},
			tailwindcss = true,
			ts_ls = {
				enabled = true,
			},
		}

		local servers_to_install = vim.tbl_filter(function(key)
			local t = servers[key]
			if type(t) == "table" then
				return not t.manual_install
			else
				return t
			end
		end, vim.tbl_keys(servers))

		require("mason").setup({ PATH = "prepend" })
		local ensure_installed = {
			"pyright",
			"pylsp",
			"stylua",
			"lua_ls",
			"bashls",
			"rust_analyzer",
			"vimls",
			"yamlls",
			"ts_ls",
		}

		vim.list_extend(ensure_installed, servers_to_install)
		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
			automatic_installation = true,
		})

		for name, config in pairs(servers) do
			if config == true then
				config = {}
			end
			config = vim.tbl_deep_extend("force", {}, {
				capabilities = capabilities,
				handlers = handlers,
			}, config)

			lspconfig[name].setup(config)
		end

		local disable_semantic_tokens = {
			lua = true,
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

				local settings = servers[client.name]
				if type(settings) ~= "table" then
					settings = {}
				end

				vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
				vim.keymap.set("n", "gf", ":lua require('conform').format()<cr>", { desc = "LSP: Format" })
				vim.keymap.set("n", "gn", vim.lsp.buf.rename, { desc = "LSP: Rename" })
				vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })

				local filetype = vim.bo[bufnr].filetype
				if disable_semantic_tokens[filetype] then
					client.server_capabilities.semanticTokensProvider = nil
				end

				-- Override server capabilities
				---@diagnostic disable-next-line: undefined-global
				if server_capabilities then
					---@diagnostic disable-next-line: undefined-global
					for k, v in pairs(server_capabilities) do
						if v == vim.NIL then
							---@diagnostic disable-next-line: cast-local-type
							v = nil
						end

						client.server_capabilities[k] = v
					end
				end
			end,
		})

		-- Autoformatting Setup
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
			},
		})

		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	callback = function(args)
		-- 		require("conform").format({
		-- 			bufnr = args.buf,
		-- 			lsp_fallback = true,
		-- 			quiet = true,
		-- 		})
		-- 	end,
		-- })

		-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		-- for type, icon in pairs(signs) do
		-- 	local hl = "DiagnosticSign" .. type
		-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		-- end

		for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
			vim.fn.sign_define("DiagnosticSign" .. diag, {
				text = "",
				texthl = "DiagnosticSign" .. diag,
				linehl = "",
				numhl = "DiagnosticSign" .. diag,
			})
		end

		require("tiny-inline-diagnostic").setup({
			signs = {
				left = "", -- ""
				right = "", -- ""
				diag = "", -- "●"
				arrow = "", -- "   "
				up_arrow = "", -- "   "
				vertical = "", -- " │"
				vertical_end = "", -- " └"
			},
			hi = {
				error = "DiagnosticError",
				warn = "DiagnosticWarn",
				info = "DiagnosticInfo",
				hint = "DiagnosticHint",
				arrow = "NonText",
				background = "CursorLine",
				mixing_color = "None",
			},
			blend = {
				factor = 0.27,
			},
		})

		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
}
