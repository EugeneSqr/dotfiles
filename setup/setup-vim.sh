#!/bin/bash
appendLine ~/.vim/vimrc ":so $dotfiles_dir/vim/vimrc"
# Russian spellcheck
wget http://ftp.vim.org/vim/runtime/spell/ru.utf-8.{spl,sug} -NP ~/.vim/spell
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
# Powerline fonts for vim Airline
fong_dir=~/.local/share/fonts
font_name=PowerlineSymbols.otf
mkdir -p $fong_dir
if [ ! -f $fong_dir/$font_name ]; then
    wget https://github.com/Lokaltog/powerline/raw/develop/font/$font_name -qP $fong_dir
    fc-cache -f -v
fi

font_config_dir=~/.config/fontconfig/fonts.conf
font_config_name=10-powerline-symbols.conf
mkdir -p $font_config_dir
if [ ! -f $font_config_dir/$font_config_name ]; then
    wget https://github.com/Lokaltog/powerline/raw/develop/font/$font_config_name -qP $font_config_dir
fi
