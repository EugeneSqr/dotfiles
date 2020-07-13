#!/bin/bash
function setup_account() {
    mkdir -p ~/.mutt/$2/cache/{headers,bodies}
    touch ~/.mutt/$2/certificates

    local account_muttrc=~/.mutt/$2/muttrc
    if [ ! -f $account_muttrc ]; then
        touch $account_muttrc
    fi

    appendLine $account_muttrc "set imap_user = \"$1\""
    echo "Enter mail app password: "
    local password
    read password

    appendLine $account_muttrc "set folder = \"imaps://imap.gmail.com:993\""
    appendLine $account_muttrc "set spoolfile = \"+INBOX\""
    appendLine $account_muttrc "set postponed = \"+[Gmail]/Drafts\""
    appendLine $account_muttrc "set trash = \"+[Gmail]/Trash\""
    appendLine $account_muttrc "set imap_pass = \"$password\""
    appendLine $account_muttrc "set smtp_url = \"smtp://$2@smtp.gmail.com:587/\""
    appendLine $account_muttrc "set smtp_pass = \"$password\""
    appendLine $account_muttrc "set from = \"$1\""
    appendLine $account_muttrc "set realname = \"Eugene Skurikhin\""
    appendLine $account_muttrc "set header_cache=~/.mutt/$2/cache/headers"
    appendLine $account_muttrc "set message_cachedir=~/.mutt/$2/cache/bodies"
    appendLine $account_muttrc "set certificate_file=~/.mutt/$2/certificates"
    appendLine $account_muttrc "bind  index g  noop"
    appendLine $account_muttrc "macro index gi \"<change-folder>=INBOX<enter>\" \"Go to inbox\""
    appendLine $account_muttrc "macro index gs \"<change-folder>=[Gmail]/Sent%20Mail<enter>\" \"Go to sent mail\""
    appendLine $account_muttrc "macro index gt \"<change-folder>=[Gmail]/Trash<enter>\" \"Go to trash\""
    appendLine $account_muttrc "bind  index,pager d  noop"
    appendLine $account_muttrc "macro index,pager dd \":set delete=yes resolve=no<enter><clear-flag>N<save-message>=[Gmail]/Trash<enter><enter><sync-mailbox>\" \"Trash\""
    appendLine $account_muttrc "bind  index,pager y  noop"
    appendLine $account_muttrc "macro index,pager yy \":set delete=yes resolve=no<enter><clear-flag>N<save-message>=[Gmail]/All%20Mail<enter><enter><sync-mailbox>\" \"Archive\""
}

echo "setup mutt with gmail (y/n)? "
read should_setup_mutt
if [ $should_setup_mutt = y ]; then
    if [ ! -d ~/.mutt ]; then
        mkdir ~/.mutt

        account_names=()
        while true; do
            # setting up personal data
            echo "Enter email address: "
            read emailAddress # e.g. google@gmail.com
            if [ "$emailAddress" == "" ]; then
                break
            fi
            account_name=${emailAddress%@*}    # e.g. google
            setup_account $emailAddress $account_name
            account_names+=($account_name)
        done

        muttrc=~/.mutt/muttrc
        if [ -f $muttrc ]; then
            rm $muttrc
        fi
        touch $muttrc
        appendLine $muttrc "source $dotfiles_dir/mutt/muttrc"
        appendLine $muttrc "source $dotfiles_dir/mutt/colorscheme.muttrc"
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
    fi
fi
