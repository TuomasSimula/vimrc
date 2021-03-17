#!/usr/bin/env bash

file_path="`realpath "$0"`"
dir_path="`dirname "$file_path"`"
path_to_vimrc="$dir_path/vimrc"
tgt_path="`realpath -s $HOME/.vimrc`"

if [ -f $HOME/.vimrc ] || [ -L $HOME/.vimrc ]; then
	read -p ".vimrc already exists, replace file? (y/n) " -r prompt

	if [[ $prompt =~ ^(yes|y)$ ]]; then
		rm $HOME/.vimrc
		ln -s "$path_to_vimrc" $HOME/.vimrc
		echo "vimrc linked to $tgt_path"
	else
		echo "setup failed"
	fi
else
	ln -s "$path_to_vimrc" $HOME/.vimrc
	echo "vimrc linked to $tgt_path"
fi

# Add update-vimrc.sh to $HOME/.profile file to run automatically on login
run_cmd="$dir_path/update-vimrc.sh"
if [ -f $HOME/.profile ] && ! grep run_cmd $HOME/.profile ; then
	echo "$run_cmd" >> $HOME/.profile
	echo "update-vimrc.sh added to $HOME/.profile"
elif [ ! -f $HOME/.profile ]; then
	touch $HOME/.profile
	echo "$run_cmd" >> $HOME/.profile
	echo "update-vimrc.sh added to $HOME/.profile"
fi
