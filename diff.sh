 #!/bin/bash

FILE_DIFF=false 

while read file; do
  if ! diff $file ~/$file >/dev/null ; then
    echo $file out of sync
    FILE_DIFF=true
  fi
done <files.dat

if ! $FILE_DIFF ; then
  echo 'No difference'
fi
