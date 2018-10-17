#!/bin/bash

#https://stackoverflow.com/a/246128 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
BAKDIR="$DIR/backup"
mkdir -p $BAKDIR

#Big bash
mv ~/.bashrc $BAKDIR/.bashrc
ln -sfv $DIR/.bashrc ~/.bashrc
mv ~/.bash_aliases $BAKDIR/.bash_aliases
ln -sfv $DIR/.bash_aliases ~/.bash_aliases
mv ~/.bash_profile $BAKDIR/.bash_profile
ln -sfv $DIR/.bash_profile ~/.bash_profile

#Tasty Tmux
mv ~/.tmux.conf $BAKDIR/.tmux.conf
ln -sfv $DIR/.tmux.conf ~/.tmux.conf

#Variosu Vims
mv ~/.vimrc $BAKDIR/.vimrc
ln -sfv $DIR/.vimrc ~/.vimrc
mv ~/.vim $BAKDIR/.vim
ln -sfv $DIR/.vim ~/.vim

#Cool .config
## sway
mkdir -p $BAKDIR/.config
if [ -d ~/.config/sway ]; then
	mv ~/.config/sway $BAKDIR/.config/sway
	ln -sfv $DIR/.config/sway ~/.config
fi
## waybar
if [ -d ~/.config/waybar ]; then
	mv ~/.config/waybar $BAKDIR/.config/waybar
	ln -sfv $DIR/.config/waybar ~/.config
fi

# Glorious git
if [ $USER = "genbyte" ]; then
	mv ~/.gitconfig $BAKDIR/.gitconfig
	### copy instead of link as to avoid singingkey entries
	cp $DIR/.gitconfig ~/.gitconfig
fi
