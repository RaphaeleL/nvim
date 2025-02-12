#!/bin/bash

set -xe

git clone --depth 1 https://github.com/neovim/neovim
cd neovim
git switch -c nightly
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd .. 
rm -rf neovim
