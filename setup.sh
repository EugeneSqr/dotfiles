#!/bin/bash
set -e
XDG_CONFIG_HOME=${XDG_CONFIG_HME:="$HOME/.config"}
dotfiles_dir=$PWD
. ./setup/helper-functions.sh
. ./setup/setup-readline.sh
. ./setup/setup-bash.sh
. ./setup/setup-vim.sh
. ./setup/setup-git.sh
. ./setup/setup-mutt.sh
. ./setup/setup-terminator.sh
. ./setup/setup-xfce4-terminal.sh
. ./setup/setup-run-or-raise.sh
