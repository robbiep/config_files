while read file; do
  cp $file ~/$file
done <files.dat
