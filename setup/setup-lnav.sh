#!/usr/bin/env bash
set -e

lnav_config_dir="$XDG_CONFIG_HOME/lnav/configs/installed"
mkdir -p "$lnav_config_dir"
ln -sf "$DOTFILES/lnav/settings.json" "$lnav_config_dir/"
