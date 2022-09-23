#!/bin/bash

function print_logo() {
  clear
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
}

function remove_nvim() {
  echo "+-----------------------------------------------------------+"
  echo "|Remove Previous Neovim ...                                 |"
  echo "+-----------------------------------------------------------+"
  rm -rf /usr/local/bin/nvim
  rm -rf /usr/local/share/nvim/
}

function remove_config() {
  echo "+-----------------------------------------------------------+"
  echo "|Remove Old Configuration ...                               |"
  echo "+-----------------------------------------------------------+"
  rm -rf ~/.config/nvim
  rm -rf ~/.local/bin/nvim
  rm -rf ~/.local/share/nvim/
  rm -rf ~/.cache/nvim
}

function clone_neovim() {
  echo "+-----------------------------------------------------------+"
  echo "|Clone the Neovim Repository ...                            |"
  echo "+-----------------------------------------------------------+"
  git clone https://github.com/neovim/neovim.git ~/neovim
}

function install_neovim() {
  echo "+-----------------------------------------------------------+"
  echo "|Install Neovim ...                                         |"
  echo "+-----------------------------------------------------------+"
  cd ~/neovim
  git checkout v0.7.2 
  make CMAKE_BUILD_TYPE=Release
  make install
}

function remove_nvim_repo() {
  echo "+-----------------------------------------------------------+"
  echo "|Remove Neovim Repository ...                               |"
  echo "+-----------------------------------------------------------+"
  rm -rf ~/neovim
}

function clone_config() {
  echo "+-----------------------------------------------------------+"
  echo "|Clone the NaVim Configuration Repository ...               |"
  echo "+-----------------------------------------------------------+"
  git clone https://github.com/RaphaeleL/nvim.git ~/config/nvim
}

function install_packer() {
  echo "+-----------------------------------------------------------+"
  echo "|Install Packer ...                                         |"
  echo "+-----------------------------------------------------------+"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

function hint() {
  print_logo 
  echo "Make Sure to manually run ':PackerInstall' when starting nvim for the first time."
}


function confirm() {
  local question="$1"
  while true; do
    msg "$question"
    read -p "[y]es or [n]o (default: no) : " -r answer
    case "$answer" in
      y | Y | yes | YES | Yes)
        return 0
        ;;
      n | N | no | NO | No | *[[:blank:]]* | "")
        return 1
        ;;
      *)
        msg "Please answer [y]es or [n]o."
        ;;
    esac
  done
}

function main() {
  print_logo 
  if confirm "Would you like to install Neovim?"; then 
    clone_neovim
    install_neovim
    remove_nvim_repo
  fi
  clone_config
  install_packer
  hint
}

main
