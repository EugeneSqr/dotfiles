#!/bin/bash
if [ ! -d ~/.config/terminator ]; then
    mkdir ~/.config/terminator
    ln -s $dotfiles_dir/terminator/config ~/.config/terminator/config
fi
