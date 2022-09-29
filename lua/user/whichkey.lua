local menu = require("which-key")

menu.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 1, 1, 1, 1 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = true,
  hidden = { "<silent>", ":", ":", "<cr>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

menu.register({
  ["<Leader>"] = {
    [";"] = { ":Alpha<cr>", "Dashboard" },
    Q = { ":qa!<cr>", "Quit All" },
    q = { ":q!<cr>", "Quit" },
    n = { ":noh<cr>", "No Highlighting" },
    f = { ":Telescope find_files<cr>", "Find files" },
    e = { ":NvimTreeToggle<cr>", "File Explorer" },
    c = { ":bdelete!<cr>", "Close" },
    u = { ":UndotreeToggle<cr>", "History" },
    r = { ":Jaq bang<cr>", "Run Code" },
    k = { ":CommentToggle<cr>", "Comment Line" },
    o = { ":Telescope lsp_document_symbols<cr>", "Outline" },
    l = { ":'<,'>CommentToggle<cr>", "Comment Block" },
    h = {
      name = "+Harpoon",
      n = { ":lua require('harpoon.ui').nav_next()<cr>", "Show Next" },
      p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Show Prev" },
      a = { ":lua require('harpoon.mark').add_file()<cr>", "Add File" },
      s = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Menu" },
    },
    b = {
      name = "+Buffer",
      b = { ":Telescope buffers<cr>", "Show buffers" },
      c = { ":bdelete<cr>", "Close Window" },
      v = { ":vsplit<cr>", "Vertical Split" },
      h = { ":split<cr>", "Horizontal Split" },
    },
    s = {
      name = "+Search (and Replace)",
      r = { ":Telescope oldfiles<cr>", "Open Recent File" },
      t = { ":Telescope live_grep<cr>", "Live Grep" },
      g = { ":lua require('spectre').open_visual()<cr>", "Project" },
      l = { ":lua require('spectre').open_file_search()<cr>", "File" },
    },
    d = {
      name = "+Diagnostics",
      r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
      l = { ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Line Diagnostic" },
      p = { ":lua vim.lsp.diagnostic.show_position_diagnostics()<cr>", "Position Diagnostic" },
      d = { ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Diagnostics Buffer" },
      w = { ":Telescope diagnostics<cr>", "Diagnostics Workspace" },
      s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
      f = { ":lua vim.lsp.buf.formatting()<cr>", "Format" },
      e = { ":LspInfo<cr>", "Info" },
      o = { ":LspInstallInfo<cr>", "Installer Info" },
      n = { ":lua vim.lsp.diagnostic.goto_next()<cr>", "Next Diagnostic" },
      N = { ":lua vim.lsp.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
    },
    a = {
      name = "+Actions",
      c = { ":lua vim.lsp.buf.declaration()<cr>", "Declaration" },
      a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Actions" },
      R = { ":lua vim.lsp.buf.references()<cr>", "References" },
      D = { ":lua vim.lsp.buf.definition()<cr>", "Definition" },
      h = { ":lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
      q = { ":lua vim.diagnostic.setloclist()<cr>", "Set Location List" },
      I = { ":lua vim.lsp.buf.implementation()<cr>", "Implementation" },
      i = { ":lua vim.lsp.buf.hover()<cr>", "Informations" },
      s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Symbols Workspace" },
    },
    g = {
      name = "+Git",
      s = { ":Telescope git_status<cr>", "Status" },
      l = { ":LazyGit<cr>", "LazyGit" },
      c = { ":Telescope git_commits<cr>", "Commits" },
      b = { ":Telescope git_branches<cr>", "Branches" },
      d = { ":Gitsigns diffthis HEAD<cr>", "Diff" },
      a = { ":Gitsigns blame_line<cr>", "Blame" },
      t = { ":Gitsigns toggle_signs<cr>", "Toggle Line" },
      n = { ":Gitsigns toggle_numhl<cr>", "Toggle Num" },
    },
    ["."] = {
      name = "+Help",
      h = { ":lua require('telescope.builtin').help_tags()<cr>", "Configuration Help" },
      k = { ":Telescope keymaps<cr>", "Keymaps" },
      c = { ":Telescope commands<cr>", "Commands" },
    },
    ["p"] = {
      name = "+Packer",
      i = { ":PackerInstall<cr>", "Install" },
      s = { ":PackerSync<cr>", "Sync" },
      c = { ":PackerClean<cr>", "Clean" },
      C = { ":PackerCompile<cr>", "Compile" },
    },
    ["t"] = {
      name = "+Terminal",
      t = { ":ToggleTerm<cr>", "Open Terminal" },
      f = { ":ToggleTerm direction=float<cr>", "Open Floating Terminal" },
    },
    ["S"] = {
      name = "+UI",
      i = { ":IndentBlanklineToggle<cr>", "Indentline" },
      t = { ":Gitsigns toggle_signs<cr>", "Git Toggle Line" },
      n = { ":Gitsigns toggle_numhl<cr>", "Git Toggle Num" },
      c = { ":Telescope colorscheme<cr>", "Colorscheme" },
      m = { ":Mason<cr>", "LSP Package Manager (Mason)" },
    },
  },
})








-- local status_ok, which_key = pcall(require, "which-key")
-- if not status_ok then
--   return
-- end

-- local setup = {
--   plugins = {
--     marks = true, -- shows a list of your marks on ' and `
--     registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
--     spelling = {
--       enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
--       suggestions = 20, -- how many suggestions should be shown in the list?
--     },
--     -- the presets plugin, adds help for a bunch of default keybindings in Neovim
--     -- No actual key bindings are created
--     presets = {
--       operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
--       motions = false, -- adds help for motions
--       text_objects = false, -- help for text objects triggered after entering an operator
--       windows = true, -- default bindings on <c-w>
--       nav = true, -- misc bindings to work with windows
--       z = true, -- bindings for folds, spelling and others prefixed with z
--       g = true, -- bindings for prefixed with g
--     },
--   },
--   -- add operators that will trigger motion and text object completion
--   -- to enable all native operators, set the preset / operators plugin above
--   -- operators = { gc = "Comments" },
--   key_labels = {
--     -- override the label used to display some keys. It doesn't effect WK in any other way.
--     -- For example:
--     -- ["<space>"] = "SPC",
--     ["<leader>"] = "SPC",
--     -- ["<cr>"] = "RET",
--     -- ["<tab>"] = "TAB",
--   },
--   icons = {
--     breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
--     separator = "➜", -- symbol used between a key and it's label
--     group = "+", -- symbol prepended to a group
--   },
--   popup_mappings = {
--     scroll_down = "<c-d>", -- binding to scroll down inside the popup
--     scroll_up = "<c-u>", -- binding to scroll up inside the popup
--   },
--   window = {
--     border = "rounded", -- none, single, double, shadow
--     position = "bottom", -- bottom, top
--     margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
--     padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
--     winblend = 0,
--   },
--   layout = {
--     height = { min = 4, max = 25 }, -- min and max height of the columns
--     width = { min = 20, max = 50 }, -- min and max width of the columns
--     spacing = 3, -- spacing between columns
--     align = "center", -- align columns left, center or right
--   },
--   ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
--   hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
--   show_help = false, -- show help message on the command line when the popup is visible
--   -- triggers = "auto", -- automatically setup triggers
--   -- triggers = {"<leader>"} -- or specify a list manually
--   triggers_blacklist = {
--     -- list of mode / prefixes that should never be hooked by WhichKey
--     -- this is mostly relevant for key maps that start with a native binding
--     -- most people should not need to change this
--     i = { "j", "k" },
--     v = { "j", "k" },
--   },
-- }

-- local opts = {
--   mode = "n", -- NORMAL mode
--   prefix = "<leader>",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }

-- local m_opts = {
--   mode = "n", -- NORMAL mode
--   prefix = "m",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }

-- local m_mappings = {
--   a = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
--   c = { "<cmd>silent BookmarkClear<cr>", "Clear" },
--   b = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
--   m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
--   ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
--   [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
--   l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },
--   j = { "<cmd>silent BookmarkNext<cr>", "Next" },
--   s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
--   k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
--   S = { "<cmd>silent BookmarkShowAll<cr>", "Prev" },
--   -- s = {
--   --   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
--   --   "Show",
--   -- },
--   x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
--   [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
-- }

-- local mappings = {
--   -- ["1"] = "which_key_ignore",
--   a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action" },
--   b = { "<cmd>Telescope buffers<cr>", "Buffers" },
--   e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
--   v = { "<cmd>vsplit<cr>", "vsplit" },
--   h = { "<cmd>split<cr>", "split" },
--   w = { "<cmd>w<CR>", "Write" },
--   -- h = { "<cmd>nohlsearch<CR>", "No HL" },
--   q = { '<cmd>lua require("user.functions").smart_quit()<CR>', "Quit" },
--   ["/"] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', "Comment" },
--   -- ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
--   c = { "<cmd>Bdelete!<CR>", "Close Buffer" },

--   -- :lua require'lir.float'.toggle()
--   -- ["f"] = {
--   --   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
--   --   "Find files",
--   -- },
--   -- ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
--   -- P = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
--   -- ["R"] = { '<cmd>lua require("renamer").rename()<cr>', "Rename" },
--   -- ["z"] = { "<cmd>ZenMode<cr>", "Zen" },
--   ["gy"] = "Link",

--   B = {
--     name = "Browse",
--     i = { "<cmd>BrowseInputSearch<cr>", "Input Search" },
--     b = { "<cmd>Browse<cr>", "Browse" },
--     d = { "<cmd>BrowseDevdocsSearch<cr>", "Devdocs" },
--     f = { "<cmd>BrowseDevdocsFiletypeSearch<cr>", "Devdocs Filetype" },
--     m = { "<cmd>BrowseMdnSearch<cr>", "Mdn" },
--   },

--   p = {
--     name = "Packer",
--     c = { "<cmd>PackerCompile<cr>", "Compile" },
--     i = { "<cmd>PackerInstall<cr>", "Install" },
--     s = { "<cmd>PackerSync<cr>", "Sync" },
--     S = { "<cmd>PackerStatus<cr>", "Status" },
--     u = { "<cmd>PackerUpdate<cr>", "Update" },
--   },

--   o = {
--     name = "Options",
--     c = { '<cmd>lua vim.g.cmp_active=false<cr>', "Completion off" },
--     C = { '<cmd>lua vim.g.cmp_active=true<cr>', "Completion on" },
--     w = { '<cmd>lua require("user.functions").toggle_option("wrap")<cr>', "Wrap" },
--     r = { '<cmd>lua require("user.functions").toggle_option("relativenumber")<cr>', "Relative" },
--     l = { '<cmd>lua require("user.functions").toggle_option("cursorline")<cr>', "Cursorline" },
--     s = { '<cmd>lua require("user.functions").toggle_option("spell")<cr>', "Spell" },
--     t = { '<cmd>lua require("user.functions").toggle_tabline()<cr>', "Tabline" },

--   },

--   -- s = {
--   --   name = "Split",
--   --   s = { "<cmd>split<cr>", "HSplit" },
--   --   v = { "<cmd>vsplit<cr>", "VSplit" },
--   -- },

--   s = {
--     name = "Session",
--     s = { "<cmd>SaveSession<cr>", "Save" },
--     r = { "<cmd>RestoreSession<cr>", "Restore" },
--     x = { "<cmd>DeleteSession<cr>", "Delete" },
--     f = { "<cmd>Autosession search<cr>", "Find" },
--     d = { "<cmd>Autosession delete<cr>", "Find Delete" },
--     -- a = { ":SaveSession<cr>", "test" },
--     -- a = { ":RestoreSession<cr>", "test" },
--     -- a = { ":RestoreSessionFromFile<cr>", "test" },
--     -- a = { ":DeleteSession<cr>", "test" },
--   },

--   r = {
--     name = "Replace",
--     r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
--     w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
--     f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
--   },

--   d = {
--     name = "Debug",
--     b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
--     c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
--     i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
--     o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
--     O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
--     r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
--     l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
--     u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
--     x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
--   },

--   -- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
--   -- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
--   -- require("dapui").open()
--   -- require("dapui").close()
--   -- require("dapui").toggle()

--   f = {
--     name = "Find",
--     b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--     c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
--     f = { "<cmd>Telescope find_files<cr>", "Find files" },
--     t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
--     s = { "<cmd>Telescope grep_string<cr>", "Find String" },
--     h = { "<cmd>Telescope help_tags<cr>", "Help" },
--     H = { "<cmd>Telescope highlights<cr>", "Highlights" },
--     i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
--     l = { "<cmd>Telescope resume<cr>", "Last Search" },
--     M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
--     r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
--     R = { "<cmd>Telescope registers<cr>", "Registers" },
--     k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
--     C = { "<cmd>Telescope commands<cr>", "Commands" },
--   },

--   g = {
--     name = "Git",
--     g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
--     j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
--     k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
--     l = { "<cmd>GitBlameToggle<cr>", "Blame" },
--     p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
--     r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
--     R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
--     s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
--     u = {
--       "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
--       "Undo Stage Hunk",
--     },
--     o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
--     b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--     c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
--     d = {
--       "<cmd>Gitsigns diffthis HEAD<cr>",
--       "Diff",
--     },
--     G = {
--       name = "Gist",
--       a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
--       d = { "<cmd>Gist -d<cr>", "Delete" },
--       f = { "<cmd>Gist -f<cr>", "Fork" },
--       g = { "<cmd>Gist -b<cr>", "Create" },
--       l = { "<cmd>Gist -l<cr>", "List" },
--       p = { "<cmd>Gist -b -p<cr>", "Create Private" },
--     },
--   },

--   l = {
--     name = "LSP",
--     a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--     c = { "<cmd>lua require('user.lsp').server_capabilities()<cr>", "Get Capabilities" },
--     d = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
--     w = {
--       "<cmd>Telescope lsp_workspace_diagnostics<cr>",
--       "Workspace Diagnostics",
--     },
--     f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
--     F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
--     i = { "<cmd>LspInfo<cr>", "Info" },
--     h = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle Hints" },
--     H = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" },
--     I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
--     j = {
--       "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
--       "Next Diagnostic",
--     },
--     k = {
--       "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
--       "Prev Diagnostic",
--     },
--     v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual Text" },
--     l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
--     o = { "<cmd>SymbolsOutline<cr>", "Outline" },
--     q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
--     r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--     R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
--     s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
--     S = {
--       "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
--       "Workspace Symbols",
--     },
--     t = { '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
--     u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
--   },

--   -- s = {
--   --   name = "Surround",
--   --   ["."] = { "<cmd>lua require('surround').repeat_last()<cr>", "Repeat" },
--   --   a = { "<cmd>lua require('surround').surround_add(true)<cr>", "Add" },
--   --   d = { "<cmd>lua require('surround').surround_delete()<cr>", "Delete" },
--   --   r = { "<cmd>lua require('surround').surround_replace()<cr>", "Replace" },
--   --   q = { "<cmd>lua require('surround').toggle_quotes()<cr>", "Quotes" },
--   --   b = { "<cmd>lua require('surround').toggle_brackets()<cr>", "Brackets" },
--   -- },

--   S = {
--     -- name = "Session",
--     -- s = { "<cmd>SaveSession<cr>", "Save" },
--     -- l = { "<cmd>LoadLastSession!<cr>", "Load Last" },
--     -- d = { "<cmd>LoadCurrentDirSession!<cr>", "Load Last Dir" },
--     -- f = { "<cmd>Telescope sessions save_current=false<cr>", "Find Session" },
--     name = "SnipRun",
--     c = { "<cmd>SnipClose<cr>", "Close" },
--     f = { "<cmd>%SnipRun<cr>", "Run File" },
--     i = { "<cmd>SnipInfo<cr>", "Info" },
--     m = { "<cmd>SnipReplMemoryClean<cr>", "Mem Clean" },
--     r = { "<cmd>SnipReset<cr>", "Reset" },
--     t = { "<cmd>SnipRunToggle<cr>", "Toggle" },
--     x = { "<cmd>SnipTerminate<cr>", "Terminate" },
--   },

--   t = {
--     name = "Terminal",
--     ["1"] = { ":1ToggleTerm<cr>", "1" },
--     ["2"] = { ":2ToggleTerm<cr>", "2" },
--     ["3"] = { ":3ToggleTerm<cr>", "3" },
--     ["4"] = { ":4ToggleTerm<cr>", "4" },
--     n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
--     u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
--     t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
--     p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
--     f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
--     h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
--     v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
--   },

--   T = {
--     name = "Treesitter",
--     h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
--     p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
--     r = { "<cmd>TSToggle rainbow<cr>", "Rainbow" },
--   },

--   -- z = {
--   --   name = "Zen",
--   --   z = { "<cmd>TZAtaraxis<cr>", "Zen" },
--   --   m = { "<cmd>TZMinimalist<cr>", "Minimal" },
--   --   n = { "<cmd>TZNarrow<cr>", "Narrow" },
--   --   f = { "<cmd>TZFocus<cr>", "Focus" },
--   -- },
-- }

-- local vopts = {
--   mode = "v", -- VISUAL mode
--   prefix = "<leader>",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }
-- local vmappings = {
--   ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', "Comment" },
--   s = { "<esc><cmd>'<,'>SnipRun<cr>", "Run range" },
--   -- z = { "<cmd>TZNarrow<cr>", "Narrow" },
-- }

-- which_key.setup(setup)
-- which_key.register(mappings, opts)
-- which_key.register(vmappings, vopts)
-- which_key.register(m_mappings, m_opts)
