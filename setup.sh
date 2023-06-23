#!/bin/bash
set -e
XDG_CONFIG_HOME=${XDG_CONFIG_HME:="$HOME/.config"}
HOME_LOCAL_BIN="$HOME/.local/bin"
dotfiles_dir=$PWD
mkdir -p "$HOME_LOCAL_BIN"
. ./setup/helper-functions.sh
. ./setup/setup-readline.sh
. ./setup/setup-bash.sh
. ./setup/setup-vim.sh
. ./setup/setup-git.sh
. ./setup/setup-mutt.sh
. ./setup/setup-xfce4-terminal.sh
. ./setup/setup-tmux.sh
. ./setup/setup-run-or-raise.sh
. ./setup/setup-ctags.sh
