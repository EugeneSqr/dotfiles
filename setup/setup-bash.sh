#!/bin/bash
appendLine ~/.bashrc "dotfiles_dir=$dotfiles_dir"
appendLine ~/.bashrc '. $dotfiles_dir/bash/bashrc'
appendLine ~/.bashrc 'alias dot="cd $dotfiles_dir"'
