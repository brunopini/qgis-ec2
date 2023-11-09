#!/bin/bash

# S3 bucket name and mount path
MOUNT_BUCKET=${MOUNT_BUCKET:-"qgis-bucket"}
MOUNT_PATH=${MOUNT_PATH:-"/mnt/s3"}

DEBIAN_FRONTEND=noninteractive apt-get install -y s3fs

# Create a directory for your mount point
mkdir -p "$MOUNT_PATH"
chown ubuntu:ubuntu "$MOUNT_PATH"

# Mount the S3 bucket using IAM role
echo "${MOUNT_BUCKET} ${MOUNT_PATH}" >> /etc/fstab
sed -i 's/#user_allow_other/user_allow_other/' /etc/fuse.conf
s3fs "$MOUNT_BUCKET" "$MOUNT_PATH" -o iam_role=auto -o allow_other
