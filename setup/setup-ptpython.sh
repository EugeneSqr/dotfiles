#!/usr/bin/env bash
set -e

ptpython_dir=$XDG_CONFIG_HOME/ptpython
mkdir -p "$ptpython_dir"
ln -sf "$DOTFILES/ptpython/config.py" "$ptpython_dir/"
