#!/bin/bash
appendLine ~/.vim/vimrc ":so ~/bin/dotfiles/vim/vimrc"
# Russian spellcheck
wget http://ftp.vim.org/vim/runtime/spell/ru.utf-8.{spl,sug} -NP ~/.vim/spell
# Russian personal dictionary
if [ ! -f ~/.vim/spell/ru.utf-8.add ]; then
    ln -s ~/bin/dotfiles/vim/spell/ru.utf-8.add ~/.vim/spell/ru.utf-8.add
fi
# English personal dictionary
if [ ! -f ~/.vim/spell/en.utf-8.add ]; then
    ln -s ~/bin/dotfiles/vim/spell/en.utf-8.add ~/.vim/spell/en.utf-8.add
fi
# Vundle + plugins
if [ ! -d ~/.vim/bundle ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi
# Powerline fonts for vim Airline
fontDir=~/.local/share/fonts
fontName=PowerlineSymbols.otf
mkdir -p $fontDir
if [ ! -f $fontDir/$fontName ]; then
    wget https://github.com/Lokaltog/powerline/raw/develop/font/$fontName -qP $fontDir
    fc-cache -f -v
fi

fontConfigDir=~/.config/fontconfig/fonts.conf
fontConfigName=10-powerline-symbols.conf
mkdir -p $fontConfigDir
if [ ! -f $fontConfigDir/$fontConfigName ]; then
    wget https://github.com/Lokaltog/powerline/raw/develop/font/$fontConfigName -qP $fontConfigDir
fi
