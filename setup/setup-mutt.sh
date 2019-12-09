#!/bin/bash
function setup_account() {
    progress "creating cache folders inside .mutt for $2"
    mkdir -p ~/.mutt/$2/cache/{headers,bodies}
    progress "creating certificate file inside .mutt"
    touch ~/.mutt/$2/certificates

    local account_muttrc=~/.mutt/$2/muttrc
    if [ ! -f $account_muttrc ]; then
        touch $account_muttrc
    fi

    appendLine $account_muttrc "set imap_user = \"$1\""
    progress "Enter mail app password: "
    local password
    read password

    appendLine $account_muttrc "set imap_pass = \"$password\""
    appendLine $account_muttrc "set smtp_url = \"smtp://$2@smtp.gmail.com:587/\""
    appendLine $account_muttrc "set smtp_pass = \"$password\""
    appendLine $account_muttrc "set from = \"$1\""
    appendLine $account_muttrc "set realname = \"Eugene Skurikhin\""
    appendLine $account_muttrc "set header_cache=~/.mutt/$2/cache/headers"
    appendLine $account_muttrc "set message_cachedir=~/.mutt/$2/cache/bodies"
    appendLine $account_muttrc "set certificate_file=~/.mutt/$2/certificates"
}

progress "want to setup mutt with gmail (y/n)? "
read should_setup_mutt
if [ $should_setup_mutt = y ]; then
    if [ ! -d ~/.mutt ]; then
        progress "creating ~/.mutt folder"
        mkdir ~/.mutt

        progress "setting up personal accounts, enter empty email to skip"
        account_names=()
        while true; do
            #setting up personal data
            progress "Enter email address: "
            read emailAddress #e.g. google@gmail.com
            if [ "$emailAddress" == "" ]; then
                break
            fi
            account_name=${emailAddress%@*}    #e.g. google
            setup_account $emailAddress $account_name
            account_names+=($account_name)
        done

        muttrc=~/.mutt/muttrc
        if [ -f $muttrc ]; then
            rm $muttrc
        fi
        touch $muttrc
        appendLine $muttrc "source ~/bin/dotfiles/mutt/muttrc"
        appendLine $muttrc "source ~/bin/dotfiles/mutt/colorscheme.muttrc"
        # default config
        appendLine $muttrc "source ~/.mutt/${account_names[0]}/muttrc"

        # Macros for switching accounts
        for i in "${!account_names[@]}"; do
            appendLine $muttrc "macro index <f$((i+2))> '<sync-mailbox><enter-command>source ~/.mutt/${account_names[$i]}/muttrc<enter><change-folder>!<enter>'"
        done

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
