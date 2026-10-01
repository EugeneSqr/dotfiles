#!/usr/bin/env bash
set -e

if [ ! -f "$HOME_LOCAL_BIN/run-or-raise" ]; then
    ln -s $DOTFILES/run-or-raise "$HOME_LOCAL_BIN/run-or-raise"
fi
