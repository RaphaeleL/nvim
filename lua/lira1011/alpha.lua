local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	require("user.notify").message("Could not load alpha", "Loading Error", "error")
	return
end
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

dashboard.section.header.val = {
	"                                                     ",
	"                                                     ",
	"                                                     ",
	"                                                     ",
	"                                                     ",
	"  ███╗   ██╗ █████╗  █████╗ ██╗   ██╗██╗███╗   ███╗  ",
	"  ████╗  ██║██╔══██╗██╔══██╗██║   ██║██║████╗ ████║  ",
	"  ██╔██╗ ██║███████║███████║██║   ██║██║██╔████╔██║  ",
	"  ██║╚██╗██║██╔══██║██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║  ",
	"  ██║ ╚████║██║  ██║██╔══██║ ╚████╔╝ ██║██║ ╚═╝ ██║  ",
	"  ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  ",
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
