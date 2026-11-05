-- Ardo support for Neovim.
--
-- The syntax definitions are shared with Vim and live in the sibling
-- `../vim` directory (a complete Vim plugin: syntax/, ftdetect/, ...).
-- This script registers the `ardo` filetype for *.ardo files and puts the
-- shared directory on 'runtimepath'.  Load this directory one of these ways:
--
--   vim.opt.runtimepath:append(vim.fn.expand("~/.../editors/neovim"))
--
--   -- lazy.nvim:
--   { dir = "~/.../editors/neovim" }
--
-- (Pointing at ~/.../editors/vim directly also works; Neovim reads
-- Vimscript plugins as-is.)

local source = debug.getinfo(1, "S").source:sub(2) -- this file
local root = vim.fn.fnamemodify(source, ":p:h:h")   -- .../editors/neovim
local shared = vim.fn.fnamemodify(root .. "/../vim", ":p:h")
-- `make neovim` (editors/Makefile) copies the Vim files next to this plugin.
if vim.fn.filereadable(root .. "/syntax/ardo.vim") == 1 then
  shared = root
end

local rtp = vim.opt.runtimepath:get()
if vim.fn.isdirectory(shared) ~= 1 then
  vim.notify("ardo: syntax files not found at " .. shared
    .. " (load editors/neovim from a full ardo checkout, or add editors/vim to 'runtimepath')",
    vim.log.levels.WARN)
elseif not vim.tbl_contains(rtp, shared) then
  vim.opt.runtimepath:append(shared)
end

vim.filetype.add({ extension = { ardo = "ardo" } })

-- Tree-sitter (editors/tree-sitter-ardo): when a parser named `ardo` can be
-- loaded, highlighting, folds and indentation come from it instead of the
-- Vim syntax. The parser is parser/ardo.so on 'runtimepath': built by
-- `make` in editors/tree-sitter-ardo, copied by `make neovim`, or installed
-- by nvim-treesitter. Without one the Vim syntax above stays in use.
-- Turn it off with `vim.g.ardo_treesitter = false`.
local ts_dir = vim.fn.fnamemodify(root .. "/../tree-sitter-ardo", ":p:h")
if vim.fn.isdirectory(ts_dir .. "/queries") == 1 and not vim.tbl_contains(vim.opt.runtimepath:get(), ts_dir) then
  vim.opt.runtimepath:append(ts_dir)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ardo",
  callback = function(args)
    if vim.g.ardo_treesitter == false then
      return
    end
    local has_parser = pcall(vim.treesitter.language.add, "ardo")
    if not has_parser or not pcall(vim.treesitter.start, args.buf, "ardo") then
      return -- no parser: keep the Vim syntax
    end
    -- Folds from queries/ardo/folds.scm, all open at first.
    -- Opt out with `vim.g.ardo_treesitter_folds = false`.
    if vim.g.ardo_treesitter_folds ~= false then
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldlevel = 99
    end
  end,
})

-- Language server: `ardo --lsp` (see docs/tools/lsp.md) for diagnostics while you
-- type, hover, go to definition, document symbols and completion. It starts
-- for every ardo buffer when `ardo` is on PATH. Turn it off with
-- `vim.g.ardo_lsp = false`, or point at another binary with
-- `vim.g.ardo_lsp_cmd = { "/path/to/ardo", "--lsp" }`.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ardo",
  callback = function(args)
    if vim.g.ardo_lsp == false then
      return
    end
    local cmd = vim.g.ardo_lsp_cmd or { "ardo", "--lsp" }
    if vim.fn.executable(cmd[1]) ~= 1 then
      if not vim.g.ardo_lsp_warned then
        vim.g.ardo_lsp_warned = true
        vim.notify("ardo: language server '" .. cmd[1] .. "' not found; put ardo on PATH"
          .. " or set vim.g.ardo_lsp_cmd = { \"/path/to/ardo\", \"--lsp\" }", vim.log.levels.WARN)
      end
      return
    end
    local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(args.buf))
    local marker = vim.fs.find({ ".git", "modules" }, { upward = true, path = dir })[1]
    vim.lsp.start({
      name = "ardo",
      cmd = cmd,
      root_dir = marker and vim.fs.dirname(marker) or dir,
    }, { bufnr = args.buf })
  end,
})
