require('nvim_comment').setup( {
  active = true,
  on_config_done = nil,
  padding = true,
  ignore = "^$",
  mappings = {
    basic = true,
    extra = false,
  },
  toggler = {
    line = "gcc",
    block = "gbc",
  },
  opleader = {
    line = "gc",
    block = "gb",
  },
  pre_hook = pre_hook,
  post_hook = nil,
})
