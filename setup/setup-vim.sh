#!/usr/bin/env bash
set -e

spell_dir=~/.vim/spell
mkdir -p "$spell_dir"
append_line ~/.vim/vimrc ":so $dotfiles_dir/vim/vimrc"
# Russian spellcheck
# downloading the files can be slow, skip it if the file is already there
if [ ! -f "$spell_dir/ru.utf-8.spl" ]; then
    (cd "$spell_dir" && \
    curl -O 'http://ftp.vim.org/vim/runtime/spell/ru.utf-8.spl' \
         -O 'http://ftp.vim.org/vim/runtime/spell/ru.utf-8.sug')
    # Russian personal dictionary
    ln -sf "$dotfiles_dir/vim/spell/ru.utf-8.add" "$spell_dir/ru.utf-8.add"
    # English personal dictionary
    ln -sf "$dotfiles_dir/vim/spell/en.utf-8.add" "$spell_dir/en.utf-8.add"
fi

# Vundle + plugins
if [ ! -d ~/.vim/bundle ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

# ultisnips snippets
ln -sf $dotfiles_dir/vim/UltiSnips ~/.vim/UltiSnips
