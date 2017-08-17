dotfiles
========

## Prerequisites
Install all of these using your OS's package manager

* git
* vim
* mutt
* dropbox

## Setting up the environment
Run setup.sh

## Don't forget to setup backup routine
mkdir /home/$USER/.backup
crontab -e
@reboot bash /home/<username>/bin/dotfiles/backup.sh
