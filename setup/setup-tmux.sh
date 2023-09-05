#!/usr/bin/env bash
set -e

if [ ! -f "$HOME/.tmux.conf" ]; then
    ln -s "$dotfiles_dir/tmux/.tmux.conf" "$HOME/"
fi

ln -sf "$dotfiles_dir/tmux/tmux_run" "$HOME_LOCAL_BIN"
