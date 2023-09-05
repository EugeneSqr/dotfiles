#!/usr/bin/env bash
set -e

if [ ! -f "$XDG_CONFIG_HOME/xfce4/terminal/terminalrc" ]; then
    ln -s "$dotfiles_dir/xfce4-terminal/terminalrc" "$XDG_CONFIG_HOME/xfce4/terminal/"
fi
