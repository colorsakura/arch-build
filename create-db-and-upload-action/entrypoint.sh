#!/bin/bash
set -e

init_path=$PWD
mkdir upload_packages
cp $local_path/*/*/*.tar.zst ./upload_packages/

if [ ! -f ~/.config/rclone/rclone.conf ]; then
    mkdir --parents ~/.config/rclone
    echo "[onedrive]" >> ~/.config/rclone/rclone.conf
    echo "type = onedrive" >> ~/.config/rclone/rclone.conf

    echo "client_id=$RCLONE_ONEDRIVE_CLIENT_ID" >> ~/.config/rclone/rclone.conf
    echo "client_secret=$RCLONE_ONEDRIVE_CLIENT_SECRET" >> ~/.config/rclone/rclone.conf
    echo "region=$RCLONE_ONEDRIVE_REGION" >> ~/.config/rclone/rclone.conf
    echo "drive_type=$RCLONE_ONEDRIVE_DRIVE_TYPE" >> ~/.config/rclone/rclone.conf
    echo "token=$RCLONE_ONEDRIVE_TOKEN" >> ~/.config/rclone/rclone.conf
    echo "drive_id=$RCLONE_ONEDRIVE_DRIVE_ID" >> ~/.config/rclone/rclone.conf
fi

if [ ! -z "$GPG_PRIVATE_KEY" ]; then
    echo "$GPG_PRIVATE_KEY" | gpg --import
fi

cd upload_packages || exit 1

repo-add "./${repo_name:?}.db.tar.gz" ./*.tar.zst
python3 $init_path/create-db-and-upload-action/sync.py
#rm "./${repo_name:?}.db.tar.gz"
#rm "./${repo_name:?}.files.tar.gz"

if [ ! -z "$GPG_PRIVATE_KEY" ]; then
    packages=( "*.tar.zst" )
    for name in $packages
    do
      if [ ! -z "$GPG_PASSWORD" ]; then
        gpg --batch --passphrase $GPG_PASSWORD --detach-sig --yes $name
        repo-add --verify --sign "./${repo_name:?}.db.tar.gz" ./*.tar.zst
        ls -al
      else
        gpg --detach-sig --yes $name
        repo-add --verify --sign "./${repo_name:?}.db.tar.gz" ./*.tar.zst
      fi
    done
fi
rclone copy ./ "onedrive:${dest_path:?}" --copy-links