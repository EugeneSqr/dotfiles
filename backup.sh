#!/bin/bash
REMOTE_DISK="$HOME/remote"

DESTINATION="$HOME/.backup"
if [ ! -d "$DESTINATION" ]; then
    mkdir "$DESTINATION"
fi

# Create archive filename.
day=$(LANG=en_us_88591;date +%A)
hostname=$(cat /proc/sys/kernel/hostname)
archive_file="$hostname-$day.tgz"

# Print start status message.
echo "Backing up $REMOTE_DISK $DOCS_PRIVATE to $DESTINATION/$archive_file"

# Backup the files using tar.
tar --exclude "$REMOTE_DISK/.private" \
    -czf "$DESTINATION/$archive_file" "$REMOTE_DISK" "$DOCS_PRIVATE" && \
    gpg -o "$DESTINATION/$archive_file.gpg" --symmetric "$DESTINATION/$archive_file" && \
    rm "$DESTINATION/$archive_file"

# Print end status message.
echo "Backup finished"

# Long listing of files in $DESTINATION to check file sizes.
ls -lh "$DESTINATION"
