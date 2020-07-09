#!/bin/bash
chmod +x ~/bin/dotfiles/run-or-raise
if [ ! -f ~/bin/run-or-raise ]; then
    ln -s ~/bin/dotfiles/run-or-raise ~/bin/run-or-raise
fi
