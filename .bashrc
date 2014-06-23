# .bashrc

function ssh_to_dev(){
  ssh -t dev-code$1.nj01.shuttercloud.net "cd code/shutterstock ; bash"
}
alias dev=ssh_to_dev
alias ss='cd ~/code/shutterstock;'
alias g='git'
alias v='vim'
alias r='rock'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
