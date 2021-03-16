#!/usr/bin/env bash

file_path="`realpath "$0"`"
dir_path="`dirname "$file_path"`"
path_to_vimrc="$dir_path/vimrc"
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


update_job="@reboot $dir_path/update_vimrc.sh > /dev/null"
crontab -l > mycrontab
if ! grep -q "$update_job" mycrontab;
then
	echo "$update_job" >> mycrontab
	crontab mycrontab
	echo "set to update on reboot"
else
	echo "already set to update"
fi
rm mycrontab
