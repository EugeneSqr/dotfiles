dotfiles
========

## Prerequisites
Install all of these using your OS's package manager

* git
* vim
* mutt
* terminator
* wmctrl
* dropbox

## Setting up the environment
Run setup.sh

## Don't forget to setup backup routine
mkdir /home/$USER/.backup
crontab -e
@reboot bash /home/<username>/bin/dotfiles/backup.sh

## Setup dropbox
Some linux distributions can't handle dropbox autolaunch properly
Here is how it can be done: https://github.com/joeroback/dropbox

dropbox exclude add *.lock
