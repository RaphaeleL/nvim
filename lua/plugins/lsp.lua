local servers = {
    bashls = true,
    lua_ls = {
        server_capabilities = { semanticTokensProvider = vim.NIL, },
    },
    rust_analyzer = true,
    clangd = {
        init_options = { clangdFileStatus = true },
        filetypes = { "c", "cpp" },
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
    ts_ls = { enabled = true, },
}
local disable_semantic_tokens = { lua = true }
local ensure_installed = { "pyright", "pylsp", "stylua", "lua_ls", "bashls",
    "rust_analyzer", "vimls", "yamlls", "ts_ls", }

return {
	"neovim/nvim-lspconfig",
	-- event = { "BufReadPre", "BufNewFile" },
	event = 'InsertEnter',
	dependencies = {
		"folke/neodev.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
        "saghen/blink.cmp",
		{ "j-hui/fidget.nvim", event = { "BufReadPre", "BufNewFile" } },
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

		local servers_to_install = vim.tbl_filter(function(key)
			local t = servers[key]
			if type(t) == "table" then
				return not t.manual_install
			else
				return t
			end
		end, vim.tbl_keys(servers))

		require("mason").setup({ PATH = "prepend" })

		vim.list_extend(ensure_installed, servers_to_install)
		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
			automatic_installation = true,
		})

		for name, config in pairs(servers) do
			if config == true then config = {} end
			config = vim.tbl_deep_extend("force", {}, {
                ocapabilities = require('blink.cmp').get_lsp_capabilities(),f
			}, config)

			require("lspconfig")[name].setup(config)
		end

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

				if server_capabilities then
					for k, v in pairs(server_capabilities) do
						if v == vim.NIL then
							v = nil
						end

						client.server_capabilities[k] = v
					end
				end
			end,
		})

		vim.diagnostic.config({ virtual_text = false, })
	end,
}
