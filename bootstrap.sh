#!/bin/bash

# Ask for sudo to avoid blocking bootstrap
sudo echo 'Root Granted'

# Install Dependencies
./nix.sh

# Change default
sudo chsh -s /bin/zsh $USER

# Link config files
ln -s zshrc ~/.zshrc
ln -s hyper.js ~/.hyper.js
ln -s tmux.conf ~/.tmux.conf
ln -s alacritty.yml ~/.config/alacritty/alacritty.yml
