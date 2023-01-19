#!/bin/sh

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

mv ~/.config/nvim.bak ~/.config/nvim
mv ~/.local/share/nvim.bak ~/.local/share/nvim

