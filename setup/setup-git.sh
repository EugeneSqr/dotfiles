#!/bin/bash
read -p "Setup git (y/n)? " should_setup_git
if [ $should_setup_git = y ]; then
    gitconfig_dir=$XDG_CONFIG_HOME/git
    gitconfig=$gitconfig_dir/config
    mkdir -p "$gitconfig_dir" && cat ./setup/template.gitconfig > "$gitconfig"
    sed -i "s:<path>:$dotfiles_dir\/gitconfig:g" "$gitconfig"
fi
