#!/bin/bash
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
        appendLine $muttconfig "source ~/bin/dotfiles/mutt/colorscheme.muttrc"

        #setting up personal data
        progress "Enter google account: "
        read google_account                         #e.g. google@gmail.com
        google_account_name=${google_account%@*}    #e.g. google
        appendLine $muttconfig "set imap_user = \"$google_account\""
        progress "Enter google mail app password (don't confuse with google password!): "
        read gmail_password
        appendLine $muttconfig "set imap_pass = \"$gmail_password\""
        appendLine $muttconfig "set smtp_url = \"smtp://$google_account_name@smtp.gmail.com:587/\""
        appendLine $muttconfig "set smtp_pass = \"$gmail_password\""
        appendLine $muttconfig "set from = \"$google_account\""
        appendLine $muttconfig "set realname = \"Eugene Skurikhin\""


        mailcap=~/.mutt/mailcap
        if [ ! -f $mailcap ]; then
            touch $mailcap
            appendLine $mailcap "text/html; lynx -assume_charset=%{charset} -display_charset=utf-8 -dump %s; nametemplate=%s.html; copiousoutput"
            appendLine $mailcap "application/rtf; okular %s;"
            appendLine $mailcap "application/pdf; okular %s;"
        fi

        pass "setting up mutt"
    else
        pass "setting up mutt (already set up)"
    fi
else
    pass "setting up mutt (skipped)"
fi
