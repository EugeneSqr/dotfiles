#!/bin/bash
if [ ! -d ~/.config/terminator ]; then
    mkdir ~/.config/terminator
    ln -s ~/bin/dotfiles/terminator/config ~/.config/terminator/config
fi
