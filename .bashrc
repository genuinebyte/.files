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
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# Start sway if on tty1
if [ $(hostname) == "mal"  ] && [ $(tty) = "/dev/tty1" ]; then
	neofetch
	sway
	exit 0
fi

# Gnome if on tty2 (Sway doesn't seem to lock the mouse)
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty2 ]] && [[ -z $XDG_SESSION_TYPE ]]; then
  XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
fi
