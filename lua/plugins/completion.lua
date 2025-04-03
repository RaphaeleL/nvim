local function has_words_before()
    local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local icon_provider, hl_provider

local function get_kind_icon(CTX)
    if not icon_provider then
        local _, mini_icons = pcall(require, "mini.icons")
        if _G.MiniIcons then
            icon_provider = function(ctx)
                local is_specific_color = ctx.kind_hl and ctx.kind_hl:match "^HexColor" ~= nil
                if ctx.item.source_name == "LSP" then
                    local icon, hl = mini_icons.get("lsp", ctx.kind or "")
                    if icon then
                        ctx.kind_icon = icon
                        if not is_specific_color then ctx.kind_hl = hl end
                    end
                elseif ctx.item.source_name == "Path" then
                    ctx.kind_icon, ctx.kind_hl = mini_icons.get(ctx.kind == "Folder" and "directory" or "file", ctx.label)
                elseif ctx.item.source_name == "Snippets" then
                    ctx.kind_icon, ctx.kind_hl = mini_icons.get("lsp", "snippet")
                end
            end
        end
        if not icon_provider then
            local lspkind_avail, lspkind = pcall(require, "lspkind")
            if lspkind_avail then
                icon_provider = function(ctx)
                    if ctx.item.source_name == "LSP" then
                        local icon = lspkind.symbolic(ctx.kind, { mode = "symbol" })
                        if icon then ctx.kind_icon = icon end
                    elseif ctx.item.source_name == "Snippets" then
                        local icon = lspkind.symbolic("snippet", { mode = "symbol" })
                        if icon then ctx.kind_icon = icon end
                    end
                end
            end
        end
        if not icon_provider then icon_provider = function() end end
    end
    if not hl_provider then
        local highlight_colors_avail, highlight_colors = pcall(require, "nvim-highlight-colors")
        if highlight_colors_avail then
            local kinds
            hl_provider = function(ctx)
                if not kinds then kinds = require("blink.cmp.types").CompletionItemKind end
                if ctx.item.kind == kinds.Color then
                    local doc = vim.tbl_get(ctx, "item", "documentation")
                    if doc then
                        local color_item = highlight_colors_avail and highlight_colors.format(doc, { kind = kinds[kinds.Color] })
                        if color_item and color_item.abbr_hl_group then
                            if color_item.abbr then ctx.kind_icon = color_item.abbr end
                            ctx.kind_hl = color_item.abbr_hl_group
                        end
                    end
                end
            end
        end
        if not hl_provider then hl_provider = function() end end
    end
    icon_provider(CTX)
    hl_provider(CTX)
    return { text = CTX.kind_icon .. CTX.icon_gap, highlight = CTX.kind_hl }
end

local servers = {
    bashls = true,
    lua_ls = {
        server_capabilities = { semanticTokensProvider = vim.NIL, },
    },
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
local ensure_installed = { "pyright", "lua_ls", "bashls", "clangd", "vimls", "ts_ls", "tailwindcss" }
local function read_file_names_of_dir(dir)
    local files = {}
    for file in io.popen('ls "' .. dir .. '"'):lines() do
        table.insert(files, file:match('(.+)%..+'))
    end
    return files
end

local SHOULD_USE_NEW_LSP = false

return {
    "Saghen/blink.cmp",
    -- event = { "InsertEnter", "CmdlineEnter" },
    event = { "VeryLazy" },
    -- opts_extend = { "sources.default", "cmdline.sources", "term.sources" },
    dependencies = not SHOULD_USE_NEW_LSP and {
	    "neovim/nvim-lspconfig",
		"folke/neodev.nvim",
        "williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
    config = function()
        require("blink.cmp").setup({
            sources = { default = { "lsp", "path", "snippets", "buffer" }, },
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
                        if has_words_before() or vim.api.nvim_get_mode().mode == "c" then return cmp.show() end
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
                    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                    draw = {
                        treesitter = { "lsp" },
                        components = {
                            kind_icon = {
                                text = function(ctx) return get_kind_icon(ctx).text end,
                                highlight = function(ctx) return get_kind_icon(ctx).highlight end,
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
                        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                    },
                },
            },
            signature = {
                window = {
                    border = "rounded",
                    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
                },
            },
        })
        if SHOULD_USE_NEW_LSP then
            vim.lsp.config("*", {
                capabilities = require('blink.cmp').get_lsp_capabilities(),
                root_markers = { ".git" },
            })
            vim.diagnostic.config({ virtual_lines = false, virtual_text = false })
            vim.lsp.enable(read_file_names_of_dir("lsp"))
        else
            require("neodev").setup({})

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
                    capabilities = require('blink.cmp').get_lsp_capabilities(),
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
        end
    end,
}
