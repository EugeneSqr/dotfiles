#!/bin/bash
progress "source vimrc"
appendLine ~/.vim/vimrc ":so ~/bin/dotfiles/vim/vimrc"
pass "source vimrc"

progress "setup vim Russian spell check"
wget http://ftp.vim.org/vim/runtime/spell/ru.utf-8.{spl,sug} -NP ~/.vim/spell
pass "setup vim Russian spell check"

progress "setup vim personal dictionary for Russian"
if [ ! -f ~/.vim/spell/ru.utf-8.add ]; then
    ln -s ~/bin/dotfiles/vim/spell/ru.utf-8.add ~/.vim/spell/ru.utf-8.add
fi
pass "setup vim personal dictionary for Russian"

progress "setup vim personal dictionary for English"
if [ ! -f ~/.vim/spell/en.utf-8.add ]; then
    ln -s ~/bin/dotfiles/vim/spell/en.utf-8.add ~/.vim/spell/en.utf-8.add
fi
pass "setup vim personal dictionary for English"

progress "setting up vundle (missing color scheme is ok)"
if [ ! -d ~/.vim/bundle ]; then
    echo -en "\n"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
else
    progress "already set up"
fi
pass "setting up vundle"
