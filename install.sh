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

