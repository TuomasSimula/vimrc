#!/usr/bin/env bash

# Pulls latest changes from git
# This script will be set by setup.sh to run when user logins to bash
# to automatically keep .vimrc file up-to-date
echo "updating vimrc"
cd "`dirname "$0"`"
git pull
echo "vimrc updated"
