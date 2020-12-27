#!/bin/bash
if [ ! -d ~/.config/terminator ]; then
    ln -s $dotfiles_dir/terminator ~/.config
fi
