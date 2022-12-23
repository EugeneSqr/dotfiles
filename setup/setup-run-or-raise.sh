#!/bin/bash
if [ ! -f ~/bin/run-or-raise ]; then
    ln -s $dotfiles_dir/run-or-raise "$HOME_LOCAL_BIN/run-or-raise"
fi
