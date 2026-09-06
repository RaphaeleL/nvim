-- Start Treesitter on the supported buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "lua", "make" },
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- Attach LSP 
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local bufnr = ev.buf
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
            return
        end

        -- NOTE: inbuilt completions, this can replace all completion plugins
        --         C-x C-o -> trigger completion
        --         C-n     -> next completion
        --         C-p     -> previous completion
        --         C-y     -> confirm completion

        -- if client.server_capabilities.completionProvider then
        --     vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        -- end
        -- if client.server_capabilities.definitionProvider then
        --     vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
        -- end
        -- if client:supports_method("textDocument/completion", bufnr) then
        --   vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = not true })
        -- end

        --- Disable semantic tokens
        client.server_capabilities.semanticTokensProvider = nil

        -- All the keymaps, buffer-local to the LSP-attached buffer
        local function opt(desc, others)
            return vim.tbl_extend("force", { silent = true, buffer = bufnr, desc = desc }, others or {})
        end
        vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opt("Go to definition"))
        vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<cr>", opt("Show References"))
        vim.keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<cr>", opt("Go to implementation"))
		vim.keymap.set("n", "K", ":lua vim.lsp.buf.signature_help()<cr>", opt("Toggle Signature Help"))
        vim.keymap.set("n", "<Leader>la", ":lua vim.lsp.buf.code_action()<cr>", opt("Code Action"))
        vim.keymap.set("n", "<Leader>lr", ":lua vim.lsp.buf.rename()<cr>", opt("Rename"))
        vim.keymap.set("n", "<Leader>ls", ":lua vim.lsp.buf.document_symbol()<cr>", opt("Doument Symbols"))
        -- "float = true" is deprecated, "on_jump" is the replacement
        local function jump_with_float(count)
            vim.diagnostic.jump({ count = count, on_jump = function() vim.diagnostic.open_float() end })
        end
        vim.keymap.set("n", "<Leader>dn", function() jump_with_float(1) end, opt("Next Diagnostic"))
        vim.keymap.set("n", "<Leader>dp", function() jump_with_float(-1) end, opt("Prev Diagnostic"))
    end,
})

-- Highlight Yanking and Putting (vim.hl.hl_op is new in 0.13,
-- vim.highlight.on_yank is deprecated)
vim.api.nvim_create_autocmd({ "TextYankPost", "TextPutPost" }, {
	group = vim.api.nvim_create_augroup("HighlightYank", {}),
	pattern = "*",
	callback = function()
		vim.hl.hl_op({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- Open Oil in the default Folder View when started with a directory argument
vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("ProjectDrawer", { clear = true }),
	callback = function()
		if vim.fn.argc() ~= 1 then return end
		-- oil (default_file_explorer) rewrites a directory arg to oil://<dir>
		local arg = vim.fn.argv(0)
		local dir = arg:match("^oil://(.*)") or arg
		if vim.fn.isdirectory(dir) == 1 then
			vim.cmd.cd(dir)
			if vim.bo.filetype ~= "oil" then
				vim.cmd("Oil")
			end
		end
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("json_conceal", { clear = true }),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

-- no spell in markdown
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	command = "setlocal nospell",
})

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.scrolloff = 0
		vim.opt.numberwidth = 2

		vim.bo.filetype = "terminal"
	end,
})
