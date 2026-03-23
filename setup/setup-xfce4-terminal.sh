#!/usr/bin/env bash
set -e

mkdir -p "$XDG_CONFIG_HOME/xfce4/xfconf/xfce-perchannel-xml"
ln -sf "$dotfiles_dir/xfce4-terminal/xfce4-terminal.xml" "$XDG_CONFIG_HOME/xfce4/xfconf/xfce-perchannel-xml/"
