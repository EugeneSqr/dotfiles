dotfiles
========

##Prerequisites

* git
* vim

##Setting up the environment
Run setup.sh

##Setting up yandex disk (optional)
1. Install davfs2

* debian based distros can use apt-get
* open suse should download rpm package and install manually

2. Create mount point at home
mkdir ~/yandex.disk

3. Add mount point to bookmarks (or places or whatever) in standard file manager

4. Store yandex credentials in $HOME/.davfs2/secrets like (replace <username> and <password>)
echo "/home/$USER/yandex.disk <username> <password>

5. Set file permissions accordingly
sudo chmod 0600 ~/.davfs2/secrets

6. Add the following line to /etc/fstab (root is needed). Mind the absolute path to yandex.disk and replace the <username> accordingly.
https://webdav.yandex.ru:443 /home/<username>/yandex.disk davfs users,rw,noauto 0 0

7. Add current user to davfs2 group
sudo usermod -aG davfs2 $USER

8. Set SUID bit with
chmod u+s /usr/sbin/mount.davfs

9. Logout and login again

10. Mount the drive
mount ~/yandex.disk

11. Add automatic mounting on starup.
* In open suse:
sudo crontab -e

add the following line
@reboot mount ~/yandex.disk


* In linux mint, ubuntu add the command to startup apps via GUI
mount ./yandex.disk
