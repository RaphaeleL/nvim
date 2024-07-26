return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
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

		local capabilities = nil
		if pcall(require, "cmp_nvim_lsp") then
			capabilities = require("cmp_nvim_lsp").default_capabilities()
		end

		local lspconfig = require("lspconfig")

		local servers = {
			bashls = true,
			gopls = {
				settings = {
					gopls = {
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			},
			lua_ls = {
				server_capabilities = {
					semanticTokensProvider = vim.NIL,
				},
			},
			rust_analyzer = true,
			cssls = true,
			tsserver = {
				server_capabilities = {
					documentFormattingProvider = false,
				},
			},
			jsonls = {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			},
			yamlls = {
				settings = {
					yaml = {
						schemaStore = {
							enable = false,
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			},
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
			"stylua",
			"lua_ls",
			"pyright",
			"clangd",
			"rust_analyzer",
			"gopls",
		}

		vim.list_extend(ensure_installed, servers_to_install)
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		for name, config in pairs(servers) do
			if config == true then
				config = {}
			end
			config = vim.tbl_deep_extend("force", {}, {
				capabilities = capabilities,
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
				vim.keymap.set("n", "gd", ":Telescope lsp_definitions<cr>", { buffer = 0 })
				vim.keymap.set("n", "gr", ":Telescope lsp_references<cr>", { buffer = 0 })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
				vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

				vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, { buffer = 0 })
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })

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

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				require("conform").format({
					bufnr = args.buf,
					lsp_fallback = true,
					quiet = true,
				})
			end,
		})

		require("tiny-inline-diagnostic").setup({
			signs = {
				left = "",
				right = "",
				diag = "",
				arrow = "",
				up_arrow = "",
				vertical = "",
				vertical_end = "",
			},
		})

		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
}
