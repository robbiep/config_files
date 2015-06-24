# .bashrc

######################################################################
#   ALIASES

function git_find(){
  search_term=$1
  shift
  git ls-files $@ | grep --color "$search_term"
}

alias g='git'
alias gpl='git pull'
alias gps='git push'
alias gs='git status'
alias gl='git log'
alias glp='git log -p'
alias gd='git diff'
alias gdc='git diff --cached'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gb='git branch'
alias gf=git_find
alias gfind=git_find
alias gdf='git diff $(git merge-base master $(git rev-parse --abbrev-ref HEAD))...HEAD'
alias ggrep='git grep -n'
alias gg='ggrep'
alias gdno='git diff --name-only'
alias gdfno='gdf --name-only'

alias v='vim'
alias grep='grep --color -n'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


######################################################################
#   SETTINGS

HISTSIZE=100000
export HISTFILESIZE=
export HISTTIMEFORMAT="[%F %T] "
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

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

  branch_str=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
# TODO make this work VVVVVV
#  branch_arr=(${branch_str//\// })
#  end=$(expr ${#branch_arr[@]} - 1)
#  branch="";
#  for i in $(seq 0 $end);
#  do
#    if [[ $i != $end ]]; then
#      branch="$branch/${branch_arr[$i]:0:1}"
#    else
#      dir="$branch/${branch_arr[$i]:0:20}"
#    fi
#  done

  echo \[${branch_str:0:30}\]
}

short_dirs ()
{
  pwd_dir=$(pwd)
  dir_arr=(${pwd_dir//\// })
  end=$(expr ${#dir_arr[@]} - 1)

  dir="";
  for i in $(seq 0 $end);
  do
    if [[ $i != $end ]]; then
      dir="$dir/${dir_arr[$i]:0:1}"
    else
      dir="$dir/${dir_arr[$i]}"
    fi
  done

  echo "$dir"
}

prompt=" ɸ "

PS1='\[$c_brack\]{\[$c_dir\]$(short_dirs)\[$c_brack\]}\[$c_reset$(git_color)\]$(git_prompt)\[$c_prompt\]$prompt\[$c_reset\]'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ ! "$LOGGED_IN" ]; then
  LOGGED_IN=1
  echo Logon by $USER@$HOSTNAME
fi

if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi
