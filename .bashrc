# .bashrc

######################################################################
#   ALIASES 

function ssh_to_dev(){
  ssh -t dev-code$1.nj01.shuttercloud.net "cd code/shutterstock ; bash"
}
alias dev=ssh_to_dev
alias ss='cd ~/code/shutterstock;'
alias g='git'
alias v='vim'
alias r='rock'

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

  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color="${c_git_dirty}"
  fi

  echo "$git_color$git_branch"
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

PS1='\[$c_brack\]{\[$c_dir\]$(last_two_dirs)\[$c_brack\]}\[$c_sqbr\][\[$c_reset\]$(git_prompt)\[$c_sqbr\]]\[$c_prompt\]$prompt\[$c_reset\]'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ ! "$LOGGED_IN" ]; then 
  LOGGED_IN=1
  echo Logon by $USER@$HOSTNAME
fi
