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

#Tasty Tmux
mv ~/.tmux.conf $BAKDIR/.tmux.conf
ln -sfv $DIR/.tmux.conf ~/.tmux.conf

#Variosu Vims
mv ~/.vimrc $BAKDIR/.vimrc
ln -sfv $DIR/.vimrc ~/.vimrc
mv ~/.vim $BAKDIR/.vim
ln -sfv $DIR/.vim ~/.vim

#Cool .config
mkdir -p $BAKDIR/.config
mv ~/.config/sway $BAKDIR/.config/sway
ln -sfv $DIR/.config/sway ~/.config
