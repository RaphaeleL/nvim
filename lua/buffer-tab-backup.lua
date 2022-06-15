require('bufferline').setup {
  options = {
    numbers = "none", 
      close_command = "bdelete! %d",
      right_mouse_command = "vert sbuffer %d",
      left_mouse_command = "buffer %d", 
      middle_mouse_command = nil, 
      indicator_icon = "▎",
      buffer_close_icon = "",
      --modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      name_formatter = function(buf) 
        if buf.name:match "%.md" then
          return vim.fn.fnamemodify(buf.name, ":t:r")
        end
      end,
      max_name_length = 18,
      max_prefix_length = 15, 
      tab_size = 18,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = diagnostics_indicator,
      custom_filter = custom_filter,
      offsets = {
        {
          filetype = "undotree",
          text = "Undotree",
          highlight = "PanelHeading",
          padding = 1,
        }, {
          filetype = "NvimTree",
          text = function()
            return vim.fn.getcwd()
          end,
          highlight = "Directory",
          text_align = "left"
        }, {
          filetype = "DiffviewFiles",
          text = "Diff View",
          highlight = "PanelHeading",
          padding = 1,
        }, {
          filetype = "flutterToolsOutline",
          text = "Flutter Outline",
          highlight = "PanelHeading",
        }, {
          filetype = "packer",
          text = "Packer",
          highlight = "PanelHeading",
          padding = 1,
        },
      },
      show_buffer_icons = true, 
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true, 
      separator_style = "thick",
      enforce_regular_tabs = false,
      always_show_bufferline = false,
      sort_by = "id",
  }
}

