#!/usr/bin/env bash

# This scripts resets changes made by setup.sh
# .vimrc is set to one of those saved to ./old-vimrc
# update-vimrc.sh is removed from ~/.profile

# Useful paths
file_path="`realpath "$0"`"
dir_path="`dirname "$file_path"`"
path_to_vimrc="$dir_path/vimrc"
tgt_path="`realpath -s $HOME/.vimrc`"

# Optionally change .vimrc to earlier one
if [[ -d $idr_path/old-vimrc && "$(ls -a $dir_path/old-vimrc/)" ]]; then
	echo "Restore .vimrc to an earlier version? Found the following files:"

	# List files in ./old-vimrc
	files=( $(ls -A $dir_path/old-vimrc/) )
	i=0
	for file in ${files[@]}; do
		echo " ($i) $file"
		((i++))
	done

	read -p "Type index of file you want to restore, [enter] to keep current one: " -r prompt

	# If input is a valid index, revert .vimrc to that file
	if [[ $prompt && $prompt -ge 0 && $prompt -lt $i ]] ; then
		if [ -a $tgt_path ]; then
			rm $tgt_path
		fi
		cp "$dir_path/old-vimrc/${files[$prompt]}" $tgt_path
		echo ".vimrc changed to copy of ${files[$prompt]}"
	else
		echo "Okay, .vimrc kept unchanged"
	fi
fi

# Remove the line $path/update-vimrc.sh from ~/.profile
run_cmd="$dir_path/update-vimrc.sh"
grep -v $run_cmd $HOME/.profile > .profile.tmp
mv .profile.tmp $HOME/.profile
