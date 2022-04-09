#!/bin/bash
mkdir -p ~/.vim/spell
append_line ~/.vim/vimrc ":so $dotfiles_dir/vim/vimrc"
# Russian spellcheck
(cd ~/.vim/spell && \
curl -O http://ftp.vim.org/vim/runtime/spell/ru.utf-8.spl \
     -O http://ftp.vim.org/vim/runtime/spell/ru.utf-8.sug)
# Russian personal dictionary
if [ ! -f ~/.vim/spell/ru.utf-8.add ]; then
    ln -s $dotfiles_dir/vim/spell/ru.utf-8.add ~/.vim/spell/ru.utf-8.add
fi
# English personal dictionary
if [ ! -f ~/.vim/spell/en.utf-8.add ]; then
    ln -s $dotfiles_dir/vim/spell/en.utf-8.add ~/.vim/spell/en.utf-8.add
fi
# Vundle + plugins
if [ ! -d ~/.vim/bundle ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi
