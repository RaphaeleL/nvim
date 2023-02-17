#!/bin/sh

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout v0.8.3
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
