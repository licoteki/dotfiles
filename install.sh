#!/bin/bash

echo "Installing dotfiles..."

echo "Creating symbolic link..."

ln -s ./bash/.bashrc "$HOME/.bashrc"
ln -s ./zsh/.zshrc "$HOME/.zshrc"
ln -s ./fish/.fishrc "$HOME/.fishrc"
ln -s ./nvim/ "$HOME/.config/nvim"

echo "Finished installing dotfiles"
