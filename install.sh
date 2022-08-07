#!/bin/bash

# Get the neovim Repo
git clone https://github.com/neovim/neovim.git ~/neovim

# Remove Previous Stuff 
sudo rm /usr/local/bin/nvim
sudo rm -r /usr/local/share/nvim/

# Install
cd ~/neovim
git checkout release-0.7
make CMAKE_BUILD_TYPE=Release
sudo make install

# Remove the neovim Repo
rm -rf ~/neovim

git clone https://github.com/RaphaeleL/nvim.git ~/config/nvim

echo "Type 'nvim' in the Terminal. Now you should be in Neovim :D yeey. Start install all the Plugins with 'PackerInstall'."
