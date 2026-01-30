.PHONY: backup
backup:
	@mv ~/.config/nvim ~/.config/nvim.bat

.PHONY: remove
remove:
	@rm -rf ~/.config/nvim 
	@rm -rf ~/.config/nvim.bat
	@rm -rf ~/.local/share/nvim
	@rm -rf ~/.local/state/nvim 

.PHONY: unbackup
unbackup:
	mv ~/.config/nvim.bat ~/.config/nvim

.PHONY: install 
install:
	@echo 'git clone --depth 1 https://github.com/neovim/neovim ~/neovim'
	@echo 'cd ~/neovim'
	@echo 'git pull && git clean -fdx' # in case when the repo already exists
	@echo 'make CMAKE_BUILD_TYPE=RelWithDebInfo'
	@echo 'sudo make install'

.PHONY: delete 
delete:
	@rm -rf $(which nvim)


