#!/bin/bash

# Destination directory for backups on the server
server_backup_dir="/home/b_christian/backups"

# Ensure the backup directory exists
mkdir -p "$server_backup_dir"

# Source directory for user home directories
source_dir="/home"

# Create a timestamp for the backup
timestamp=$(date +%Y%m%d_%H%M%S)

# Loop through user directories and create backups
for user_dir in "$source_dir"/*; do
    user=$(basename "$user_dir")
    zip -r "$server_backup_dir/${user}_backup_$timestamp.zip" "$user_dir"
done

echo "Backups created locally in $server_backup_dir."

# Optionally, if you want to copy the backups to another location on the server:
# Destination directory on the server
destination_dir="/path/to/destination"

# Ensure the destination directory exists
sudo mkdir -p "$destination_dir"

# Copy backups to the destination directory
sudo cp -r "$server_backup_dir"/* "$destination_dir"

echo "Backups copied to $destination_dir."
echo "Daily backup script completed."
