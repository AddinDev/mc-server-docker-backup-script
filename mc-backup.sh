#!/bin/bash

cd ../docker

trash_folder="mc-drive:trash"
source_folder="mc-jadin"
compressed_filename="backup_jadin_$(date +%Y%m%d).zip"
destination_drive_folder="mc-drive:mc worlds"
trash

sudo zip -r "$compressed_filename" "$source_folder"

rclone delete "$destination_drive_folder" --include "*backup_jadin*"

sudo rclone copy "$compressed_filename" "$destination_drive_folder"

# sudo rclone purge "$destination_drive_folder" --exclude "$compressed_filename"
sudo rm "$compressed_filename"

# sudo rclone cleanup "$trash_folder"

