#!/bin/fish

set location (dirname (realpath (status --current-file)))
set backup $location"/backup"

mkdir -p backup

function trybackup
	set file $argv[1]
	set name (basename $file)

	if test -e $file; and not test -L $file
		mv $file $backup/$name
		echo "Created backup of "$file" in directory "$backup
	end
end

# Tmux
trybackup ~/.tmux.conf
ln -sf $location/.tmux.conf ~/.tmux.conf

# Vim
trybackup ~/.vimrc
ln -sf $location/.vimrc ~/.vimrc

trybackup ~/.vim
ln -sf $location/.vim ~/.vim

# Git
# Don't copy is .gitconfig is already present
if not test -e ~/.gitconfig; test $USER = "genbyte"
	# Copy instead of link to not polute with singingkey
	cp $location/.gitconfig ~/.gitconfig
end
