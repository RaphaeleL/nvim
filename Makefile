.PHONY: config_backup
config_backup:
	@mv ~/.config/nvim ~/.config/nvim.bat

.PHONY: config_remove
config_remove:
	@rm -rf ~/.config/nvim 
	@rm -rf ~/.config/nvim.bat
	@rm -rf ~/.local/share/nvim
	@rm -rf ~/.local/state/nvim 

.PHONY: config_unbackup
config_unbackup:
	mv ~/.config/nvim.bat ~/.config/nvim

.PHONY: neovim_install
neovim_install:
	@echo 'TODO'
	@echo '----'
	@echo 'git clone --depth 1 https://github.com/neovim/neovim ~/neovim'
	@echo 'cd ~/neovim'
	@echo 'make CMAKE_BUILD_TYPE=RelWithDebInfo'
	@echo 'sudo make install'

.PHONY: neovim_remove
neovim_remove:
	@rm -rf $(which nvim)


