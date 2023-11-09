#!/bin/bash

VNC_PASSWORD=${VNC_PASSWORD:-"password"}

DEBIAN_FRONTEND=noninteractive apt-get install -y ubuntu-desktop tightvncserver gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal

# Setup VNC server with a predefined password
echo "$VNC_PASSWORD" | vncpasswd -f > /home/ubuntu/.vnc/passwd
chown ubuntu:ubuntu /home/ubuntu/.vnc/passwd
chmod 600 /home/ubuntu/.vnc/passwd

vncserver :1

# Configure VNC to start with a desktop environment
cat > /home/ubuntu/.vnc/xstartup <<EOF
#!/bin/sh
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
chmod +x /home/ubuntu/.vnc/xstartup
chown ubuntu:ubuntu /home/ubuntu/.vnc/xstartup

vncserver -kill :1

# # Create a systemd service file for VNC
# cat > /etc/systemd/system/vncserver@.service <<EOF
# [Unit]
# Description=Start TightVNC server at startup
# After=syslog.target network.target

# [Service]
# Type=forking
# User=ubuntu
# Group=ubuntu
# WorkingDirectory=/home/ubuntu

# PIDFile=/home/ubuntu/.vnc/%H:%i.pid
# ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1 || :
# ExecStart=/usr/bin/vncserver :%i
# ExecStop=/usr/bin/vncserver -kill :%i

# [Install]
# WantedBy=multi-user.target
# EOF

# # Reload the systemd manager configuration, enable and start the VNC service
# systemctl daemon-reload
# systemctl enable vncserver@1.service
# systemctl start vncserver@1.service

vncserver :1
