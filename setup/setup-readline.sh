#!/bin/bash
if [ ! -f "$HOME/.inputrc" ]; then
    ln -s "$dotfiles_dir/readline/.inputrc" "$HOME/"
fi
