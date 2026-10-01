#!/usr/bin/env bash
set -e

if [ ! -f "$HOME/.tmux.conf" ]; then
    ln -s "$DOTFILES/tmux/.tmux.conf" "$HOME/"
fi

ln -sf "$DOTFILES/tmux/tmux_run" "$HOME_LOCAL_BIN"
