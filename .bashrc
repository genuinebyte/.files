#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# https://stackoverflow.com/q/3058325
function prompt_command {
	export PS1=$(~/.bash_prompt)
}

PS1='\u@\h \W$ '
if [ -f ~/.bash_prompt ]; then
	export PROMPT_COMMAND=prompt_command
fi

# Give vim some default love
export EDITOR=vim

# Avoid successive command duplicates in history
export HISTCONTROL=ignoredups

# Bash Aliases.
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# Start sway if present and on tty1: https://stackoverflow.com/a/26278282
if [ $(tty) = "/dev/tty1" ] && (pacman -Qi sway > /dev/null 2>&1); then
	neofetch
	sway
	exit 0
fi

# Gnome if present and on tty2
if [ $(tty) = "/dev/tty2" ] && (pacman -Qi gnome-session > /dev/null 2>&1); then
	# from an SE post, lost the link
	if [[ -z $DISPLAY ]] && [[ -z $XDG_SESSION_TYPE ]]; then
		XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
	fi
fi
