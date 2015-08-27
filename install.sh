# Install Vundle if it is missing
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
fi;

# Unpack files
while read file; do
  cp $file ~/$file
done <files.dat

# Create local configs if they are not present
touch -a ~/.bashrc_local
touch -a ~/.vimrc_local.vim

# Update vim to install missing plugins
vim --noplugin +PluginInstall +PluginClean +PluginUpdate +qall
if [ -x /usr/local/bin/cmake -a ! -f ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]
  then
    # If it cmake exists but YCM not installed... lets install it
    ~/.vim/bundle/YouCompleteMe/install.py
fi
