#!/bin/bash

export MOUNT_BUCKET=${mount_bucket}
export VNC_PASSWORD=${vnc_password}

apt-get update -y

# Execute scripts
cat > /tmp/mount_s3.sh << 'MOUNT_S3_SCRIPT'
${mount_s3_script}
MOUNT_S3_SCRIPT
bash /tmp/mount_s3.sh

cat > /tmp/vnc_desktop.sh << 'VNC_DESKTOP_SCRIPT'
${vnc_desktop_script}
VNC_DESKTOP_SCRIPT
bash /tmp/vnc_desktop.sh

cat > /tmp/qgis.sh << 'QGIS_SCRIPT'
${qgis_script}
QGIS_SCRIPT
bash /tmp/qgis.sh
