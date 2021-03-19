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
# Powerline fonts for vim Airline
font_dir=~/.local/share/fonts
font_name=PowerlineSymbols.otf
mkdir -p $font_dir
if [ ! -f $font_dir/$font_name ]; then
    (cd $font_dir && curl -O https://github.com/Lokaltog/powerline/raw/develop/font/$font_name)
    fc-cache -f -v
fi

font_config_dir=~/.config/fontconfig/fonts.conf
font_config_name=10-powerline-symbols.conf
mkdir -p $font_config_dir
if [ ! -f $font_config_dir/$font_config_name ]; then
    (cd $font_config_dir && curl -O https://github.com/Lokaltog/powerline/raw/develop/font/$font_config_name)
fi
