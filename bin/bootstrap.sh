# !/bin/bash
Install s3fs to mount S3 bucket
sudo apt-get update
apt-get install -y s3fs

S3 bucket name and mount path
S3_BUCKET=${var.bucket_name}
MOUNT_PATH=/mnt/s3

Create a directory for your mount point
sudo mkdir -p ${MOUNT_PATH}
sudo chown ubuntu:ubuntu /mnt/s3

Mount the S3 bucket using IAM role
echo "qbis-bucket /mnt/s3" | sudo tee -a /etc/fstab
sudo sed -i 's/#user_allow_other/user_allow_other/' /etc/fuse.conf
s3fs ${S3_BUCKET} ${MOUNT_PATH} -o iam_role=auto -o allow_other


sudo apt install -y ubuntu-desktop
sudo apt install -y tightvncserver
sudo apt install -y gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal

vncserver :1
# You will require a password to access your desktops.

# Password: 
# Verify:   
# Would you like to enter a view-only password (y/n)? n

nano ~/.vnc/xstartup

# !/bin/sh
export XKL_XMODMAP_DISABLE=1
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey

vncconfig -iconic &
gnome-panel &
gnome-settings-daemon &
metacity &
nautilus &
gnome-terminal &
EOF

vncserver -kill :1

vncserver :1


sudo wget -O /etc/apt/keyrings/qgis-archive-keyring.gpg https://download.qgis.org/downloads/qgis-archive-keyring.gpg

sudo nano /etc/apt/sources.list.d/qgis.sources

Types: deb deb-src
URIs: https://qgis.org/debian
Suites: your-distributions-codename
Architectures: amd64
Components: main
Signed-By: /etc/apt/keyrings/qgis-archive-keyring.gpg
EOF

sudo apt install -y qgis qgis-plugin-grass


# LOCAL:

# brew install tigervnc
# brew install --cask tigervnc-viewer
