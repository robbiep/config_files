# .bash_profile

[[ -s ~/.bashrc ]] && source ~/.bashrc
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
