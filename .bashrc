#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\u@\h \W$ '

# Give vimsome default love
export EDITOR=vim

# Avoid successive command duplicates in history
export HISTCONTROL=ignoredups

# Bash Aliases.
if [ -f ~./bash_aliases ]; then
	source ~/.bash_aliases
fi

# Start sway if on laptop and tty1
if [ $(hostname) == "inara"  ] && [ $(tty) = "/dev/tty1" ]; then
	neofetch
	sway
	exit 0
fi
