-- TODO weired behaviour on file opening

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"                                                            ",
	"                          ⢠⣶⡤                               ",
	"                         ⢠⣿⡿⠁                               ",
	"                        ⢠⣿⡿⠁                      ⣀⣀        ",
	"                       ⢀⣿⡿⠁                       ⣿⣿        ",
	"     ⢀⣀⣀              ⢠⣿⡟                    ⢠⣶⣤⣀⡀⣿⣿ ⣀⣤⣴⣆   ",
	"   ⢠⣾⡿⠛⠿⣿⣶⣄⣀⣴⣿⠟      ⢠⣿⡿                     ⠉⠉⠛⠻⢿⣿⣿⡿⠿⠛⠋⠉   ",
	"   ⠉⠋    ⠙⠛⠿⠛⠁      ⢠⣿⡿⠁                        ⣴⣿⠟⠹⣿⣧⡀     ",
	"                   ⣰⣿⡟⠁            ⣠⣶⣶⣦        ⠺⡿⠋  ⠈⢿⡷⠂    ",
	"                  ⣰⣿⡟              ⢻⣿⣿⡿                     ",
	"                 ⢠⣿⡟                ⠉⠉                      ",
	"                  ⠉                                         ",
	"                                                            ",
	"                                                            ",
	"            NaaVim - A Basic IDE Layor for Neovim           ",
	"                                                            ",
	"                                                            ",
	"                                                            ",
}

dashboard.section.buttons.val = {
	dashboard.button("n", "  > New file", ":ene <BAR> startinsert <cr>"),
	dashboard.button("f", "  > Find file", ":Telescope find_files<cr>"),
	dashboard.button("r", "  > Recent", ":Telescope oldfiles<cr>"),
	dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<cr>"),
	dashboard.button("q", "  > Quit NVIM", ":qa!<cr>"),
}
alpha.setup(dashboard.opts)
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
