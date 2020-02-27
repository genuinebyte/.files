#!/bin/fish

set location (dirname (realpath (status --current-file)))
set backup $location"/backup"

mkdir -p backup

function trybackup
	set file $argv[1]
	set name (basename $file)
	set backupname $argv[2]

	if test -e $file -a ! -L $file
		if test -z $backupname
			mv $file $backup/$name
			echo "Created backup of "$file" in directory "$backup
		else
			mv $file $backup/$backupname
			echo "Created backup of"$file". You can find it at "$backup"/"$backupname
		end
	end
end

function deploy
	if test ! -L $argv[2]
		ln -sf $argv[1] $argv[2]
	end
end

function cpGit
	if test -e ~/.gitconfig
		trybackup ~/.gitconfig
		cp $location/.config/git/config ~/.gitconfig
	else
		trybackup ~/.config/git/config .gitconfig
		cp $location/.config/git/config ~/.config/git/config
	end
end

function mvGit
	if test -e ~/.gitconfig
		echo "Moving ~/.gitconfig to ~/.config/git/config"

		if test ! -d ~/.config/git
			mkdir ~/.config/git
		end

		set mkgitstat $status

		if test 0 = $mkgitstat
			echo "Nevermind, we can't create the parent directory, you're on your own"
		else
			mv ~/.gitconfig ~/.config/git/config
		end
	end
end

set options $argv
function optionPresent
	if test -z "$op"
		echo "Compile error: Option not set for optionPresent"
		exit
	end

	for var in $options
		if test $op = $var
			test 0 = 0
			return
		end
	end

	test 1 = 0
end

# Tmux
trybackup ~/.tmux.conf
deploy $location/.tmux.conf ~/.tmux.conf

# Vim
trybackup ~/.vimrc
deploy $location/.vimrc ~/.vimrc

trybackup ~/.vim
deploy $location/.vim ~/.vim

# Sway
trybackup ~/.config/sway
deploy $location/.config/sway ~/.config/sway

trybackup ~/.config/swaylock
deploy $location/.config/swaylock ~/.config/swaylock

# Waybar
trybackup ~/.config/waybar
deploy $location/.config/waybar ~/.config/waybar

# Git
set op gitconfig
if test $USER = "genbyte"
	mvGit

	if test ! -e ~/.gitconfig -a ! ~/.config/git/config
		cpGit
	else if optionPresent
		echo "I've been told to replace the existing gitconfig"
		cpGit
	end
else if optionPresent
	echo "You've told me I can mess with your gitconfig even though you're not genbyte"
	mvGit
	cpGit
end
