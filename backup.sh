#!/bin/bash
YANDEX_DISK="$HOME/Yandex.Disk"

DESTINATION="$HOME/.backup"
if [ ! -d "$DESTINATION" ]; then
    mkdir "$DESTINATION"
fi

# Create archive filename.
day=$(LANG=en_us_88591;date +%A)
hostname=$(cat /proc/sys/kernel/hostname)
archive_file="$hostname-$day.tgz"

# Print start status message.
echo "Backing up $YANDEX_DISK $DOCS_PRIVATE to $DESTINATION/$archive_file"

# Backup the files using tar.
tar --exclude "$YANDEX_DISK/.sync" \
    --exclude "$YANDEX_DISK/.private" \
    -czf "$DESTINATION/$archive_file" "$YANDEX_DISK" "$DOCS_PRIVATE" && \
    gpg -o "$DESTINATION/$archive_file.gpg" --symmetric "$DESTINATION/$archive_file" && \
    rm "$DESTINATION/$archive_file"

# Print end status message.
echo "Backup finished"

# Long listing of files in $DESTINATION to check file sizes.
ls -lh "$DESTINATION"
