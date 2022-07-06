#!/bin/bash
if [ ! -f "$HOME/.tmux.conf" ]; then
    ln -s "$dotfiles_dir/tmux/.tmux.conf" "$HOME/"
fi
