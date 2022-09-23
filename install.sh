#!/bin/bash

echo "                                                            "
echo "                          ⢠⣶⡤                               "
echo "                         ⢠⣿⡿⠁                               "
echo "                        ⢠⣿⡿⠁                      ⣀⣀        "
echo "                       ⢀⣿⡿⠁                       ⣿⣿        "
echo "     ⢀⣀⣀              ⢠⣿⡟                    ⢠⣶⣤⣀⡀⣿⣿ ⣀⣤⣴⣆   "
echo "   ⢠⣾⡿⠛⠿⣿⣶⣄⣀⣴⣿⠟      ⢠⣿⡿                     ⠉⠉⠛⠻⢿⣿⣿⡿⠿⠛⠋⠉   "
echo "   ⠉⠋    ⠙⠛⠿⠛⠁      ⢠⣿⡿⠁                        ⣴⣿⠟⠹⣿⣧⡀     "
echo "                   ⣰⣿⡟⠁            ⣠⣶⣶⣦        ⠺⡿⠋  ⠈⢿⡷⠂    "
echo "                  ⣰⣿⡟              ⢻⣿⣿⡿                     "
echo "                 ⢠⣿⡟                ⠉⠉                      "
echo "                  ⠉                                         "
echo "                                                            "
echo "                                                            "
echo "            NaaVim - A Basic IDE Layor for Neovim           "
echo "                                                            "
echo "                                                            "
echo "                                                            "

echo "Remove Previous Neovim ..."
sudo rm -rf /usr/local/bin/nvim
sudo rm -rf /usr/local/share/nvim/

echo "Remove Old Configuration ..."
sudo rm -rf ~/.config/nvim
sudo rm -rf ~/.local/bin/nvim
sudo rm -rf ~/.local/share/nvim/
sudo rm -rf ~/.cache/nvim

echo "Clone the Neovim Repository ..."
git clone https://github.com/neovim/neovim.git ~/neovim

echo "Install Neovim ..."
cd ~/neovim
git checkout v0.7.2 
make CMAKE_BUILD_TYPE=Release
sudo make install

echo "Remove Neovim Repository ..."
rm -rf ~/neovim

echo "Clone the NaVim Configuration Repository ..."
git clone https://github.com/RaphaeleL/nvim.git ~/config/nvim

echo "Install Packer ..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Make Sure to manually run ':PackerInstall' when starting nvim for the first time."
