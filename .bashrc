# .bashrc

######################################################################
#   ALIASES

function ssh_to_dev(){
  ssh -t dev-code$1.nj01.shuttercloud.net "cd code/shutterstock ; bash"
}
alias dev=ssh_to_dev
alias slp='ssh logs.shuttercorp.net'
alias slq='ssh logs.qa.shuttercorp.net'
alias sld='ssh logs.dev.shuttercorp.net'
alias spp='ssh prod-paymentworker02.ma01.shuttercorp.net'
alias spq='ssh qa-paymentworker01.nj01.shuttercloud.net'
alias spd='ssh dev-paymentworker01.nj01.shuttercloud.net'

alias dbw='db master www'
alias dbwp='cd /opt/apps/shutterstock-mason/deployment/scripts/bin;rock run perl db master www'
alias dbbp='cd /opt/apps/shutterstock-mason/deployment/scripts/bin;rock run perl db billing billing_service'

alias g='git'
alias gpl='git pull'
alias gps='git push'
alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias gf='git fetch'
alias gdf='git diff $(git merge-base master $(git rev-parse --abbrev-ref HEAD))...HEAD`'

alias v='vim'
alias r='rock'
alias t='task'
alias grep='grep --color'

alias ss='cd ~/code/shutterstock;'
alias ssm='ss cd shutterstock-mason/repo;'
alias ssma='ss cd shutterstock-mason-acceptance'
alias ssw='ss cd shutterstock-www;'
alias ssp='ss cd shutterstock-photo-api;'
alias sspu='ss cd puppet;'

alias lm='tail -f ~/code/shutterstock/shutterstock-mason/logs/*.log'
alias lma='tail -f ~/code/shutterstock/shutterstock-mason/logs/admin.error.log'
alias lmap='tail -f /var/log/flume/httpd_admin_shutterstock_com_error/current'
alias lmp='tail -f /var/log/flume/httpd_www_shutterstock_com_error/current | egrep -v "TRANSMIT_ERROR|is_bot_probably|Shutterstock::Service::Search::Client::Legacy|Shutterstock::Service::Search::V2|Invalid JSONP token|libapreq|File does not exist|recaptcha|javascript error|/opt/shutterstock-perl/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/Unicode/Normalize.pm|Absinthe"'
alias lwp='tail -f /var/log/flume/shutterstock-www__web.web.stderr.log/current /var/log/flume/shutterstock-photo-swig__web.web.std*/current /var/log/flume/shutterstock-photo-api__web.web.stdout.log/current'
alias lpp='tail -f /var/log/flume/shutterstock-photo-api__web.web.stdout.log'

######################################################################
#   SETTINGS

HISTSIZE=100000

######################################################################
#   BASH PROMPT

# fetch dynamic terminal data
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  c_reset=`tput sgr0`
  c_dir=`tput sgr0; tput setaf 5`
  c_more=`tput sgr0; tput bold; tput setaf 1`
  c_git_clean=`tput setaf 2`
  c_git_dirty=`tput setaf 1`
  c_brack=`tput sgr0; tput bold; tput setaf 3`
  c_sqbr=`tput sgr0; tput setaf 7`
  c_prompt=`tput sgr0; tput setaf 6`
else
  c_reset=
  c_dir=
  c_more=
  c_git_cleanclean=
  c_git_dirty=
  c_brack=
  c_sqbr=
  c_prompt=
fi

git_color ()
{

  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  if git diff --quiet 2>/dev/null >&2; then
    git_color="$c_git_clean"
  else
    git_color="$c_git_dirty"
  fi

  echo $git_color
}

# git branch name in prompt
git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  if [ "${git_branch:0:7}" == "feature" ]; then
    git_branch="f>${git_branch:7}"
  fi
  if [ "${git_branch:0:3}" == "bug" ]; then
    git_branch="b>${git_branch:3}"
  fi
  if [ "${git_branch:0:6}" == "bugfix" ]; then
    git_branch="b>${git_branch:6}"
  fi

  if [ "${#git_branch}" -gt 22 ]; then
    git_branch="${git_branch:0:22}>"
  fi

  echo \[$git_branch\]
}

last_two_dirs ()
{
  dir=$(pwd |rev| awk -F / '{print $1,$2}' | rev | sed s_\ _/_)
  dir=${dir//shutterstock/ss>}
  dir=${dir//Shutterstock/Ss>}
  dir=${dir//ShutterStock/SS>}
  if [ ${#dir} -gt 15 ]; then
    dir_arr=(${dir//\// })
    if [ ${#dir_arr[0]} -gt 10 ]; then
      dir_arr[0]="${dir_arr[0]:0:10}>"
    fi
    if [ ${#dir_arr[1]} -gt 10 ]; then
      dir_arr[1]="${dir_arr[1]:0:10}>"
    fi
    dir="${dir_arr[0]}/${dir_arr[1]}"
  fi
  echo "$dir"
}

prompt=" ɸ "

PS1='\[$c_brack\]{\[$c_dir\]$(last_two_dirs)\[$c_brack\]}\[$c_reset$(git_color)\]$(git_prompt)\[$c_prompt\]$prompt\[$c_reset\]'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ ! "$LOGGED_IN" ]; then 
  LOGGED_IN=1
  echo Logon by $USER@$HOSTNAME
fi
