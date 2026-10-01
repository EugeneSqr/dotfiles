#!/usr/bin/env bash
set -e

if [ ! -f "$HOME/.inputrc" ]; then
    ln -s "$DOTFILES/readline/.inputrc" "$HOME/"
fi
