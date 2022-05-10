vim.g.nvim_tree_highlight_opened_files = 1

require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  auto_reload_on_write = true,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 200,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
          { key = "l", action = "edit", action_cb = edit_or_open },
          { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
          { key = "h", action = "close_node" },
          { key = "H", action = "collapse_all", action_cb = collapse_all }
      }
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  filters = {
    dotfiles = false,
    custom = { "node_modules", ".cache", ".DS_Store" },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = true,
    },
  },
}


