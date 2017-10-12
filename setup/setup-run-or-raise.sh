#!/bin/bash
progress "setting up run-or-raise"
chmod +x ./run-or-raise
if [ ! -f ~/bin/run-or-raise ]; then
    ln -s ~/bin/dotfiles/run-or-raise ~/bin/run-or-raise
fi
pass "setting up run-or-raise"
