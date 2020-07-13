#!/bin/bash
chmod +x $dotfiles_dir/run-or-raise
if [ ! -f ~/bin/run-or-raise ]; then
    ln -s $dotfiles_dir/run-or-raise ~/bin/run-or-raise
fi
