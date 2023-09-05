#!/usr/bin/env bash
set -e

if [ ! -f "$HOME/.inputrc" ]; then
    ln -s "$dotfiles_dir/readline/.inputrc" "$HOME/"
fi
