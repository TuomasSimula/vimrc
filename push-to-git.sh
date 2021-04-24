#!/usr/bin/env bash

# This script will be set up to run when the vimrc file is edited 
# to semi-automatically push changes in vimrc to git 

# Only run if the vimrc file is in a directory that has a .git directory
# A bit clumsy, but works for now
if [ -d "./.git" ]; then	
	read -p "Push changes to git? (y/n) " -r prompt # Ask if user wants to push changes

	if [[ $prompt =~ ^(yes|y)$ ]]
	then
		# Just regular git add -> commit -> push
		# Commit message prompted from user, uname and passwd will be prompted by git
		git add .
		read -p "Enter commit message: " commit_msg
		git commit -m "$commit_msg"
		git push
	fi
fi
