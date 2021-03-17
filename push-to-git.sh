#!/usr/bin/env bash

# Set up to run when vimrc file is edited to make pushing changes in vimrc to git easy

if [ -d "./.git" ]
then	
	read -p "Push changes to git? (y/n) " -r prompt 

	if [[ $prompt =~ ^(yes|y)$ ]]
	then
		git add .
		read -p "Enter commit message: " commit_msg
		git commit -m "$commit_msg"
		git push
	fi
fi
