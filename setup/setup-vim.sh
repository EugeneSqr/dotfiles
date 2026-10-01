#!/usr/bin/env bash
set -e

spell_dir=~/.vim/spell
mkdir -p "$spell_dir"
append_line ~/.vim/vimrc ":so $DOTFILES/vim/vimrc"
# Russian spellcheck
# downloading the files can be slow, skip it if the file is already there
if [ ! -f "$spell_dir/ru.utf-8.spl" ]; then
    (cd "$spell_dir" && \
    curl -O 'http://ftp.vim.org/vim/runtime/spell/ru.utf-8.spl' \
         -O 'http://ftp.vim.org/vim/runtime/spell/ru.utf-8.sug')
    # Russian personal dictionary
    ln -sf "$DOTFILES/vim/spell/ru.utf-8.add" "$spell_dir/ru.utf-8.add"
    # English personal dictionary
    ln -sf "$DOTFILES/vim/spell/en.utf-8.add" "$spell_dir/en.utf-8.add"
fi

# Plug + plugins
if [ ! -d ~/.vim/autoload ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
fi

# ultisnips snippets
ln -sf "$DOTFILES/vim/UltiSnips" "$HOME/.vim/"
