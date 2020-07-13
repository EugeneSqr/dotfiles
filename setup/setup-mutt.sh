#!/bin/bash
function setup_account() {
    mkdir -p ~/.mutt/$2/cache/{headers,bodies}
    touch ~/.mutt/$2/certificates
    local account_muttrc=~/.mutt/$2/muttrc
    cp $dotfiles_dir/setup/$1.muttrc $account_muttrc
    read -p "Username: " account_username
    sed -i "s/<username>/$account_username/g" $account_muttrc
    read -p "Host: " account_host
    sed -i "s/<host>/$account_host/g" $account_muttrc
    read -p "Real name: " account_real_name
    sed -i "s/<real_name>/$account_real_name/g" $account_muttrc
    read -s -p "Password: " account_password
    sed -i "s/<password>/$account_password/g" $account_muttrc
    sed -i "s/<local_folder_name>/$2/g" $account_muttrc
    echo ""
}

read -p "Setup mutt? (y/n)? " should_setup_mutt
if [ $should_setup_mutt = y ]; then
    mkdir -p ~/.mutt

    local_folder_names=()
    while true; do
        read -p "Email type (gmail/outlook): " email_type
        if [ "$email_type" == "" ]; then
            break
        fi
        read -p "Local folder name (alias): " local_folder_name
        setup_account $email_type $local_folder_name
        local_folder_names+=($local_folder_name)
    done

    muttrc=~/.mutt/muttrc
    touch $muttrc
    append_line $muttrc "source $dotfiles_dir/mutt/muttrc"
    append_line $muttrc "source $dotfiles_dir/mutt/colorscheme.muttrc"
    # default config
    append_line $muttrc "source ~/.mutt/${local_folder_names[0]}/muttrc"
    # switching accounts
    for i in "${!local_folder_names[@]}"; do
        append_line $muttrc "macro index <f$((i+2))> '<sync-mailbox><enter-command>source ~/.mutt/${local_folder_names[$i]}/muttrc<enter><change-folder>!<enter>'"
    done
    mailcap=~/.mutt/mailcap
    cp $dotfiles_dir/setup/mailcap ~/.mutt/
    read -p "Open PDF with: " pdf_viewer
    sed -i "s/<pdf_viewer>/$pdf_viewer/g" $mailcap
fi
