#!/bin/bash
progress "setting up terminator"
if ! isInstalled terminator; then
    fail "setting up terminator (install terminator first)"
    return
fi

if [ -d ~/.config/terminator ]; then
    pass "setting up terminator (already set up)"
    return
fi

mkdir ~/.config/terminator
ln -s ~/bin/dotfiles/terminator/config ~/.config/terminator/config
pass "setting up terminator"
