#!/bin/bash

echo -e "Installing dotfiles...\n"
echo "HOME=$HOME"

CURRENT="$(cd $(dirname $0); pwd)"
echo "CURRENT=$CURRENT"

work_files=`find ./ -maxdepth 1 -type f \
                    -not -name \*.sh \
		    -and -not -name \*.ps1 \
		    -and -not -name \*.md \
		    -and -not -name \*.git\* | sed 's!^.*/!!'`

echo "##### dotfiles #####"
for file in $work_files;
do
	if [ ! -e $HOME/$file ] && [ ! -L $HOME/$file ]; then
		echo "[+] cleate symlink $file -> $HOME/$file"
		ln -s $CURRENT/$file $HOME/$file
	else
		echo -e "[+] $file is already exists.\n"
	fi
done

echo "##### vim config #####"
VIM="$HOME/.vim"

if [ ! -d $VIM ] && [ ! -L $VIM ]; then
	echo "[+] cleate symlink $VIM -> $CURRENT/vimfiles"
	ln -s $CURRENT/vimfiles $VIM
else
	echo -e "[+] $VIM is already exists.\n"
fi
#echo "##### install nvim #####"
#sudo apt install -y neovim

echo -e "\n"

echo "##### fish config #####"
FISH="$HOME/.config/fish"
CONFIG="$HOME/.config"

if [ ! -d $FISH ] && [ ! -L $FISH ]; then
	if [ ! -d $CONFIG ]; then
		mkdir $CONFIG
	fi
	echo "[+] cleate symlink $FISH -> $FISH"
	ln -s $CURRENT/fish $FISH
else
	echo -e "[+] $FISH is already exists.\n"
fi
echo "Finished installing dotfiles"
