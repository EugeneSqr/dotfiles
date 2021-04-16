#!/bin/bash
# What to backup. 
yandex_disk="$HOME/Yandex.Disk"
documents="$HOME/Documents/private"

# Where to backup to.
dest="$HOME/.backup"
if [ ! -d $dest ]; then
    mkdir $dest
fi

# Create archive filename.
day=$(LANG=en_us_88591;date +%A)
hostname=$(cat /proc/sys/kernel/hostname)
archive_file="$hostname-$day.tgz"

# Print start status message.
echo "Backing up $yandex_disk $documents to $dest/$archive_file"
date
echo

# Backup the files using tar.
tar --exclude $yandex_disk/.sync \
    --exclude $yandex_disk/.private \
    -czf $dest/$archive_file $yandex_disk $documents

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest
