#!/bin/bash
set -e
ctags_dir=$XDG_CONFIG_HOME/ctags
mkdir -p "$ctags_dir"
ln -sf "$dotfiles_dir/ctags/exclude.ctags" "$ctags_dir/"
