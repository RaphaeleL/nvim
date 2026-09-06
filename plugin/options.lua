vim.opt.guicursor = ""
vim.opt.fillchars = { eob = " " }
vim.opt.backup = false
-- no clipboard=unnamedplus: y/Y are mapped to "+ explicitly (keymaps.lua),
-- so yanks reach the clipboard but deletes stay out of it
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.timeoutlen = 250
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.shell = "/bin/zsh"
vim.opt.relativenumber = true
vim.opt.autochdir = false
vim.opt.smoothscroll = true

vim.o.winborder = "single"

------------- 
-- FOLDING -- 
------------- 
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldtext = ""
vim.opt.foldenable = false
-- vim.opt.foldmethod = "indent"
-- vim.opt.foldlevelstart = 99

---------------- 
-- STATUSLINE --
----------------
function _G.git_branch()
    local head = vim.fn.findfile(".git/HEAD", ".;")
    if head == "" then return "" end
    local file = io.open(head, "r")
    if not file then return "" end
    local line = file:read()
    file:close()
    local branch = line and line:match("ref: refs/heads/(.+)")
    if branch then
        return "[" .. branch .. "]"
    end
    local commit = line and line:sub(1, 7)
    return commit and ("[" .. commit .. "]") or ""
end

local config = require("config")

if config.statusline == "full" then
    vim.opt.statusline = table.concat({
      " %f",
      " %{v:lua.git_branch()}",
      " %m",
      "%=",
      " %y",
      " %l:%c",
      " [%p%%]"
    })
    vim.opt.cmdheight = 0
    vim.opt.laststatus = 3
    vim.opt.showcmd = false
    vim.opt.ruler = false
elseif config.statusline == "minimal" then
    vim.opt.statusline = table.concat({
      " %f",
      " %m",
      "%=",
      " %l:%c",
    })
    vim.opt.cmdheight = 0
    vim.opt.laststatus = 3
    vim.opt.showcmd = false
    vim.opt.ruler = false
elseif config.statusline == "disabled" then
    vim.opt.cmdheight = 0
    vim.opt.laststatus = 0
    vim.opt.showcmd = false
    vim.opt.ruler = false
end
