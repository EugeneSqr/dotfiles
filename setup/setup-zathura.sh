#!/usr/bin/env bash
set -e

zathura_dir=$XDG_CONFIG_HOME/zathura
mkdir -p "$zathura_dir"
ln -sf "$dotfiles_dir/zathura/zathurarc" "$zathura_dir/"
