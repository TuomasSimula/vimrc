#!/usr/bin/env bash

dir_path="`realpath "$0"`"
path_to_vimrc="`dirname "$dir_path"`/vimrc"
tgt_path="`realpath -s ~/.vimrc`"

if [ -f ~/.vimrc ] || [ -L ~/.vimrc ]
then
	read -p ".vimrc already exists, replace file? (y/n) " -r prompt

	if [[ $prompt =~ ^(yes|y)$ ]]
	then
		rm ~/.vimrc
		ln -s "$path_to_vimrc" ~/.vimrc
		echo "vimrc linked to $tgt_path"
	else
		echo "setup failed"
	fi
else
	ln -s "$path_to_vimrc" ~/.vimrc
	echo "vimrc linked to $tgt_path"
fi
