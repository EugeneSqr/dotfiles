#!/usr/bin/env bash
set -e

append_line ~/.bashrc "dotfiles_dir=$dotfiles_dir"
append_line ~/.bashrc '. $dotfiles_dir/bash/bashrc'
append_line ~/.bashrc 'alias dot="cd $dotfiles_dir"'
