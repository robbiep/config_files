 #!/bin/bash

FILE_DIFF=false 
if ! diff .vimrc ~/.vimrc >/dev/null ; then
  echo 'vimrc' out of sync
  $FILE_DIFF=true
fi
if ! diff .bashrc ~/.bashrc >/dev/null ; then
  echo 'bashrc' out of sync
  $FILE_DIFF=true
fi
if ! diff .bash_profile ~/.bash_profile >/dev/null ; then
  echo 'bash_profile' out of sync
  $FILE_DIFF=true
fi
if ! diff .gitconfig ~/.gitconfig >/dev/null ; then
  echo 'gitconfig' out of sync
  $FILE_DIFF=true
fi

if ! $FILE_DIFF ; then
  echo 'No difference'
fi
