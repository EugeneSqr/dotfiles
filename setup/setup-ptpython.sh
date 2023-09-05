#!/usr/bin/env bash
set -e

ptpython_dir=$XDG_CONFIG_HOME/ptpython
mkdir -p "$ptpython_dir"
ln -sf "$dotfiles_dir/ptpython/config.py" "$ptpython_dir/"
