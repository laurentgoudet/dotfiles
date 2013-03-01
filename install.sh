#!/bin/sh
if [ ! -e $HOME/.gitconfig -o -L $HOME/.gitconfig ]
then
	ln -s $PWD/.gitconfig $HOME/.gitconfig
else
	echo "Error: $HOME/.gitconfig file already exists!"
fi
