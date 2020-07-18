#!/bin/bash
read -p "Setup git (y/n)? " should_setup_git
if [ $should_setup_git = y ]; then
    gitconfig_dir=$XDG_CONFIG_HOME/git
    gitconfig=$gitconfig_dir/config
    mkdir -p "$gitconfig_dir" && cat ./setup/template.gitconfig > "$gitconfig"
    read -p "Enter github name: " input_name
    sed -i "s/<name>/$input_name/g" "$gitconfig"
    read -p "Enter github email: " input_email
    sed -i "s/<email>/$input_email/g" "$gitconfig"
    sed -i "s:<path>:$dotfiles_dir\/gitconfig:g" "$gitconfig"
fi
