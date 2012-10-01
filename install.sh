#!/bin/bash

if [ -f ~/.vimrc ] && [ ! -L ~/.vimrc ]
then
    echo "Backing up existing ~/.vimrc to ~/.vimrc.bak"
    mv ~/.vimrc ~/.vimrc.bak
fi
if [ -d ~/.vim ] && [ ! -L ~/.vim ]
then
    echo "Backing up existing ~/.vim to ~/.vim.bak"
    mv ~/.vim ~/.vim.bak
fi
if [ -L ~/.vimrc ]
then
    echo "Already have ~/.vimrc symlink, we're good"
else
    echo "Creating symlink ~/.vimrc, which points to $pwd/vimrc"
    ln -s $(pwd)/vimrc ~/.vimrc
fi
if [ -L ~/.vim ]
then
    echo "Already have ~/.vim symlink, we're good"
else
    echo "Creating symlink ~/.vim, which points to $pwd/vim"
    ln -s $(pwd)/vim ~/.vim
fi

git submodule init
git submodule update

# Command-T plugin must be built!
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
