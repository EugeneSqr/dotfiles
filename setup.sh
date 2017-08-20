#!/bin/bash
source ./setup-utility.sh

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


progress "source bashrc"
appendLine ~/.bashrc ". ~/bin/dotfiles/bash/bashrc"
pass "source bashrc"


progress "setting up vundle (missing color scheme is ok)"
if [ ! -d ~/.vim/bundle ]; then
    echo -en "\n"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
else
    progress "already set up"
fi
pass "setting up vundle"

source ./setup-fonts.sh


progress "want to setup git (y/n)? "
read should_setup_git
if [ $should_setup_git = y ]; then
    gitconfig=~/.gitconfig
    if [ ! -f $gitconfig ]; then
        echo -n "Enter github email: "
        read github_email
        touch $gitconfig
        echo "[User]" >> $gitconfig
        echo "    email = $github_email" >> $gitconfig
        echo "[include]" >> $gitconfig
        echo "    path = bin/dotfiles/gitconfig" >> $gitconfig
        echo "[core]" >> $gitconfig
        echo "    autocrlf = input" >> $gitconfig
        pass "setting up git"
    else
        pass "setting up git (already set up)"
    fi
else
    pass "setting up git (skipped)"
fi


progress "want to setup mutt with gmail (y/n)? "
read should_setup_mutt
if [ $should_setup_mutt = y ]; then
    if [ ! -d ~/.mutt ]; then
        progress "creating ~/.mutt folder"
        mkdir ~/.mutt
        progress "creating cache folders inside .mutt"
        mkdir -p ~/.mutt/cache/{headers,bodies}
        progress "creating certificate file inside .mutt"
        touch ~/.mutt/certificates

        muttconfig=~/.mutt/muttrc
        if [ ! -f $muttconfig ]; then
            touch $muttconfig
        fi

        appendLine $muttconfig "source ~/bin/dotfiles/mutt/muttrc"
        appendLine $muttconfig "source ~/bin/dotfiles/mutt/molokai.muttrc"

        #setting up personal data
        progress "Enter google account: "
        read google_account                         #e.g. google@gmail.com
        google_account_name=${google_account%@*}    #e.g. google
        appendLine $muttconfig "set imap_user = \"$google_account\""
        progress "Enter gmail password (don't confuse with google password!): "
        read gmail_password
        appendLine $muttconfig "set imap_pass = \"$gmail_password\""
        appendLine $muttconfig "set smtp_url = \"smtp://$google_account_name@smtp.gmail.com:587/\""
        appendLine $muttconfig "set smtp_pass = \"$gmail_password\""
        appendLine $muttconfig "set from = \"$google_account\""
        appendLine $muttconfig "set realname = \"Eugene Skurikhin\""


        mailcap=~/.mailcap
        touch $mailcap
        appendLine $mailcap "application/rtf; okular %s;"
        appendLine $mailcap "application/pdf; okular %s;"

        pass "setting up mutt"
    else
        pass "setting up mutt (already set up)"
    fi
else
    pass "setting up mutt (skipped)"
fi

progress "setup dropbox scripts"
wget -q "https://www.dropbox.com/download?dl=packages/dropbox.py" -O ~/bin/dropbox
chmod +x ~/bin/dropbox
pass "setup dropbox scripts"
