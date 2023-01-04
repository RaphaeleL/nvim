require("impatient")
require("nvim_comment").setup()
require("gitsigns").setup {
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
}
require("illuminate")
-- require("catppuccin").setup({ transparent_background = true })
-- require("kanagawa").setup({ transparent = true })
-- require("rose-pine").setup({ disable_background = true })
