#!/usr/bin/env bash

echo "updating vimrc"
cd "`dirname "$0"`"
git pull
echo "vimrc updated"
