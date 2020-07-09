#!/bin/bash
echo "setup git (y/n)? "
read should_setup_git
if [ $should_setup_git = y ]; then
    gitconfig=~/.gitconfig
    if [ ! -f $gitconfig ]; then
        echo -n "Enter github name: "
        read github_name
        echo -n "Enter github email: "
        read github_email
        touch $gitconfig
        echo "[User]" >> $gitconfig
        echo "    name = $github_name" >> $gitconfig
        echo "    email = $github_email" >> $gitconfig
        echo "[include]" >> $gitconfig
        echo "    path = bin/dotfiles/gitconfig" >> $gitconfig
    fi
fi
