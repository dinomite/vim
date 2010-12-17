#!bash
# After cloning this into a new homedir, setup vim
cd ~
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule update --init
