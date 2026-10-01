#!/usr/bin/env bash
set -e

append_line ~/.bashrc "DOTFILES=\"$DOTFILES\""
# shellcheck disable=SC2016 # $DOTFILES shouldn't expand here
append_line ~/.bashrc '. "$DOTFILES/bash/.bashrc"'
