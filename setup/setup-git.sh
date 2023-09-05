#!/usr/bin/env bash
set -e

read -p "Setup git (y/n)? " should_setup_git
if [ $should_setup_git = y ]; then
    gitconfig_dir=$XDG_CONFIG_HOME/git
    mkdir -p "$gitconfig_dir"
    ln -s "$dotfiles_dir/git/.gitconfig" "$gitconfig_dir/config"
fi
