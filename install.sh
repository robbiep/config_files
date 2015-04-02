while read file; do
  cp $file ~/$file
done <files.dat

touch -a ~/.bashrc_local
touch -a ~/.vimrc_local.vim
