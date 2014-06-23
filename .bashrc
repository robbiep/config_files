# .bashrc

function ssh_to_dev(){
  ssh -t dev-code$1.nj01.shuttercloud.net "cd code/shutterstock ; bash"
}
alias dev=ssh_to_dev
alias ss='cd ~/code/shutterstock;'
alias g='git'
alias v='vim'
alias r='rock'

function last_two_dirs {
  pwd |rev| awk -F / '{print $1,$2}' | rev | sed s_\ _/_
}
export PS1="\e[0;35m\]\t \e[1;36m\]# \[\e[m\]"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
