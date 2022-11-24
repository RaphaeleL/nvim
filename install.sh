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

function message() {
  local text="$1"
  local div_width=$(tput cols)
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "> %s\n" "$text"
  printf "%${div_width}s\n" ' ' | tr ' ' -
}

function remove_nvim() {
  message "Remove Previous Neovim ..."
  rm -rf /usr/local/bin/nvim
  rm -rf /usr/local/share/nvim/
}

function remove_config() {
  message "Remove Old Configuration ..."
  rm -rf ~/.config/nvim
  rm -rf ~/.local/bin/nvim
  rm -rf ~/.local/share/nvim/
  rm -rf ~/.cache/nvim
}

function clone_neovim() {
  message "Clone the Neovim Repository ..."
  git clone https://github.com/neovim/neovim.git ~/neovim
}

function install_neovim() {
  message "Install Neovim v0.8.1 ..."
  cd ~/neovim
  git checkout v0.8.1 
  make CMAKE_BUILD_TYPE=Release
  make install
}

function remove_nvim_repo() {
  message "Remove Neovim Repository ..."
  rm -rf ~/neovim
}

function clone_config() {
  message "Clone the NaVim Configuration Repository ..."
  git clone https://github.com/RaphaeleL/nvim.git ~/.config/nvim
}

function install_packer() {
  message "Install Packer ..."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

function hint() {
  message "Make Sure to manually run ':PackerInstall' when starting nvim for the first time."
}

function confirm() {
  local question="$1"
  while true; do
    message "$question"
    read -p "[y]es or [n]o (default: no) : " -r answer
    case "$answer" in
      y | Y | yes | YES | Yes)
        return 0
        ;;
      n | N | no | NO | No | *[[:blank:]]* | "")
        return 1
        ;;
      *)
        message "Please answer [y]es or [n]o."
        ;;
    esac
  done
}

function main() {
  print_logo 
  if confirm "Would you like to install Neovim v0.8.1 (sudo mode required)?"; then 
    clone_neovim
    install_neovim
    remove_nvim_repo
  fi
  clone_config
  install_packer
  hint
}

main
